-- Pearson Correlation Coefficient with Sample Data
-- Christopher Lee - 2021
--
-- This program is free software : you can redistribute itand /or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.If not, see < https://www.gnu.org/licenses/>.

-- Create table and insert sample data.
IF OBJECT_ID('tempdb..#SampleData') IS NOT NULL
    TRUNCATE TABLE #SampleData
ELSE
    CREATE TABLE #SampleData
    (
	a DECIMAL(18, 6) NOT NULL,
	b DECIMAL(18, 6) NOT NULL
    )
 
INSERT INTO #SampleData
 (a, b)
VALUES
 (4, 6),(9, 11),(10, 11),(9, 8),(10, 9),(9, 11),(8, 6),(12, 9),(9, 8),(11, 9),
 (13, 10),(10, 9),(14, 15),(10, 12),(8, 8),(13, 13),(8, 11),(12, 10),(10, 11),(11, 8);
 
-- Process data to determine the Pearson r value and degrees of freedom
SELECT ((SUM(a * b) - (SUM(a) * SUM(b)) / COUNT(*)))
	   / (SQRT(SUM(a * a) - (SUM(a) * SUM (a)) / COUNT(*))
      * SQRT(SUM(b * b) - (SUM(b) * SUM(b)) / COUNT(*))
      ) AS [Pearson r value],
	 count(a) - 2 as [Degrees of freedom]
 FROM #SampleData;

