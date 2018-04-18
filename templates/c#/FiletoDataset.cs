/*********************************************************
***   Author: Tim O'Brien
***   Company: Netlegger Systems Inc.
***   Date: May 1, 2006
***   Copyright 2006 Netlegger Systems Inc.
**********************************************************
***   Unit: FiletoDataset.cs
***   Purpose:  Convert a delimited file to a .NET dataset
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
using System.Data;
using System.Text.RegularExpressions;

namespace FileImport
{
	/// <summary>
	/// Summary description for FiletoDataset.
	/// </summary>
	public class FiletoDataset
	{
		public FiletoDataset()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public DataSet Convert(string sregexp, string sFile, bool firstrowcols, int maxrows) 
		{
			StreamReader stream;
			string line;
			Regex rex = new Regex(sregexp);

			if(!System.IO.File.Exists(sFile))
				return null;
			
			stream = new StreamReader(sFile, true);

			//Create a new data set
			DataSet dsFile = new DataSet("File");			
			DataTable dtTable = dsFile.Tables.Add("Data");		

			line = stream.ReadLine();
			
			//Create Columns
			string colname;
			string sTemp;
			int sStart=0;
			int nCount=0;
			int colcount=0;
			foreach (Match m in rex.Matches(line)) 
			{
				sTemp = line.Substring(sStart, m.Index - sStart);
				if (firstrowcols) colname = sTemp; else colname = "Column" + (nCount+1);
				dtTable.Columns.Add(colname, typeof(string));
				sStart = m.Index + 1;
				nCount++;
			} 
			if ((line.Length - sStart) > 0) 
			{
				sTemp=line.Substring(sStart, line.Length - sStart);
				if (firstrowcols) colname = sTemp; else colname = "Column" + (nCount+1);
				dtTable.Columns.Add(colname, typeof(string));
				colcount = nCount;
			}
			
			if (firstrowcols) line = stream.ReadLine();

			//Fill Rows;
			DataRow drRow;
			while ((line != null) && (line.Length > 0)) 
			{
				sStart=0;
				nCount=0;
				drRow = dtTable.NewRow();
				foreach (Match m in rex.Matches(line)) 
				{
					sTemp = line.Substring(sStart, m.Index - sStart);
					if (nCount > colcount) {
						if (!dtTable.Columns.Contains("Column" + (nCount+1))) 
						{
							dtTable.Columns.Add("Column" + (nCount+1), typeof(string));
							colcount++;
						}
					}
					/*if (sTemp.Length > dtTable.Columns[nCount].MaxLength) 
					{
						dtTable.Columns[nCount].MaxLength = sTemp.Length+1;
					}*/
					drRow[nCount]= sTemp;
					sStart = m.Index + 1;
					nCount++;
				}
				if ((line.Length - sStart) > 0) 
				{
					sTemp=line.Substring(sStart, line.Length - sStart);
					if (nCount <= colcount) drRow[nCount]= sTemp;
				}
				dtTable.Rows.Add(drRow);
				if ((maxrows != -1) && (nCount >= maxrows)) break;
				line = stream.ReadLine();
			}

			stream.Close();
			return dsFile;
		}

	}
}
