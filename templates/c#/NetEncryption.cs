using System;
using System.Security.Cryptography;
using System.IO;
using System.Text;

namespace NetEncryption
{
	/// <summary>
	/// NetEncryption is a wrapper of System.Security.Cryptography.SymmetricAlgorithm classes
	/// and simplifies the interface. It supports customized SymmetricAlgorithm as well.
	/// </summary>
	public class NetEncryption
	{
		/// <remarks>
		/// Supported .Net intrinsic SymmetricAlgorithm classes.
		/// </remarks>
		public enum NetEncryptionType : int
		{
			DES, RC2, Rijndael
		}

		private SymmetricAlgorithm mobjCryptoService;

		/// <remarks>
		/// Constructor for using an intrinsic .Net SymmetricAlgorithm class.
		/// </remarks>
		public NetEncryption(NetEncryptionType NetSelected)
		{
			switch (NetSelected)
			{
				case NetEncryptionType.DES:
					mobjCryptoService = new DESCryptoServiceProvider();
					break;
				case NetEncryptionType.RC2:
					mobjCryptoService = new RC2CryptoServiceProvider();
					break;
				case NetEncryptionType.Rijndael:
					mobjCryptoService = new RijndaelManaged();
					break;
			}
		}

		/// <remarks>
		/// Constructor for using a customized SymmetricAlgorithm class.
		/// </remarks>
		public NetEncryption(SymmetricAlgorithm ServiceProvider)
		{
			mobjCryptoService = ServiceProvider;
		}

		/// <remarks>
		/// Depending on the legal key size limitations of a specific CryptoService provider
		/// and length of the private key provided, padding the secret key with space character
		/// to meet the legal size of the algorithm.
		/// </remarks>
		private byte[] GetLegalKey(string Key)
		{
			string sTemp;
			if (mobjCryptoService.LegalKeySizes.Length > 0)
			{
				int lessSize = 0, moreSize = mobjCryptoService.LegalKeySizes[0].MinSize;
				// key sizes are in bits
				while (Key.Length * 8 > moreSize)
				{
					lessSize = moreSize;
					moreSize += mobjCryptoService.LegalKeySizes[0].SkipSize;
				}
				sTemp = Key.PadRight(moreSize / 8, ' ');
			}
			else
				sTemp = Key;

			// convert the secret key to byte array
			return ASCIIEncoding.ASCII.GetBytes(sTemp);
		}

		public string Encrypting(string Source, string Key)
		{
			byte[] bytIn = System.Text.ASCIIEncoding.ASCII.GetBytes(Source);
			// create a MemoryStream so that the process can be done without I/O files
			System.IO.MemoryStream ms = new System.IO.MemoryStream();

			byte[] bytKey = GetLegalKey(Key);

			// set the private key
			mobjCryptoService.Key = bytKey;
			mobjCryptoService.IV = bytKey;

			// create an Encryptor from the Provider Service instance
			try
			{
				ICryptoTransform encrypto = mobjCryptoService.CreateEncryptor();

				// create Crypto Stream that transforms a stream using the encryption
				CryptoStream cs = new CryptoStream(ms, encrypto, CryptoStreamMode.Write);

				// write out encrypted content into MemoryStream
				cs.Write(bytIn, 0, bytIn.Length);
				cs.FlushFinalBlock();
        
				// get the output and trim the '\0' bytes
				byte[] bytOut = ms.GetBuffer();
				int i = 0;
				for (i = 0; i < bytOut.Length; i++)
					if (bytOut[i] == 0)
						break;
                
				// convert into Base64 so that the result can be used in xml
				return System.Convert.ToBase64String(bytOut, 0, i);
			}
			catch (Exception ex)
			{
				Console.Out.WriteLine(ex.Message);
			}

			return null;
		}

		public string Decrypting(string Source, string Key)
		{
			// convert from Base64 to binary
			byte[] bytIn = System.Convert.FromBase64String(Source);
			// create a MemoryStream with the input
			System.IO.MemoryStream ms = new System.IO.MemoryStream(bytIn, 0, bytIn.Length);		

			byte[] bytKey = GetLegalKey(Key);

			// set the private key
			mobjCryptoService.Key = bytKey;
			mobjCryptoService.IV = bytKey;

			// create a Decryptor from the Provider Service instance
			ICryptoTransform encrypto = mobjCryptoService.CreateDecryptor();

			// create Crypto Stream that transforms a stream using the decryption
			CryptoStream cs = new CryptoStream(ms, encrypto, CryptoStreamMode.Read);

			// read out the result from the Crypto Stream
			System.IO.StreamReader sr = new System.IO.StreamReader( cs );
			return sr.ReadToEnd();
		}
	}
}
