/*********************************************************
***   Author: Tim O'Brien
***   Company: Netlegger Systems Inc.
***   Date: May 1, 2006
***   Copyright 2006 Netlegger Systems Inc.
**********************************************************
***   Unit: httpfetch.cs
***   Purpose:  Downloads the contains of a URL as a string
**********************************************************
***   Copyright (C) 2006  Netlegger Systems Inc.

***   This program is free software; you can redistribute it and/or
***   modify it under the terms of the GNU General Public License
***   as published by the Free Software Foundation; version 2
***   of the License.

***   The code can be used\modified without any limitation,
***   however, this copyright notice can not be removed.

***   This program is distributed in the hope that it will be useful,
***   but WITHOUT ANY WARRANTY; without even the implied warranty of
***   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
***   GNU General Public License for more details.

***   You should have received a copy of the GNU General Public License
***   along with this program; if not, write to the Free Software
***   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
**********************************************************/
using System;
using System.IO;
using System.Net;
using System.Text;

namespace httptools
{
	/// <summary>
	/// Summary description for httpfetch.
	/// </summary>
	public class httpfetch
	{
		/// <summary>
		/// Fetches a Web Page
		/// </summary>

		public static string GetPage(string wpage)
		{
			// used to build entire input
			StringBuilder sb  = new StringBuilder();

			// used on each read operation
			byte[]        buf = new byte[8192];

			// prepare the web page we will be asking for
			HttpWebRequest  request  = (HttpWebRequest)
				WebRequest.Create(wpage);

			// execute the request
			HttpWebResponse response = (HttpWebResponse)
				request.GetResponse();

			// we will read data via the response stream
			Stream resStream = response.GetResponseStream();

			string tempString = null;
			int    count      = 0;

			do
			{
				// fill the buffer with data
				count = resStream.Read(buf, 0, buf.Length);

				// make sure we read some data
				if (count != 0)
				{
					// translate from bytes to ASCII text
					tempString = Encoding.ASCII.GetString(buf, 0, count);

					// continue building the string
					sb.Append(tempString);
				}
			}
			while (count > 0); // any more data to read?

			// print out page source
			return sb.ToString();
		}
	}
}
