SELECT * FROM dc_bikeshare_q1_2012

SELECT founded_at, founded_at_clean
FROM crunchbase_companies_clean_data;

SELECT founded_at, founded_at_clean								-- ambil data pada kolom founded_at dan founded_at_clean
FROM crunchbase_companies_clean_data							-- dari tabel crunchbase_companies_clean_data
ORDER BY founded_at;											-- diurutkan berdasarkan founded_at

ALTER TABLE crunchbase_companies_clean_data						-- alter table crunchbase_companies_clean_data
ALTER COLUMN founded_at TYPE DATE USING founded_at::date;		-- alter kolom founded_at tipe datanya menjadi date

SELECT founded_at FROM crunchbase_companies_clean_data;

UPDATE crunchbase_companies_clean_data
SET founded_at = TO_DATE(founded_at, 'MM/DD/YY');

ALTER TABLE crunchbase_companies_clean_data
ALTER COLUMN founded_at TYPE DATE USING founded_at::date;

SELECT founded_at,												-- ambil data pada kolom founded_at
       EXTRACT(year FROM founded_at) AS year,					-- ekstrak year dari kolom founded_at dan hasilnya dijadikan sebagai data pada kolom kolom year
       EXTRACT(MONTH FROM founded_at) AS month,					-- ekstrak month dari kolom founded_at dan hasilnya dijadikan sebagai data pada kolom kolom month
       EXTRACT(DAY FROM founded_at) AS day,						-- ekstrak day dari kolom founded_at dan hasilnya dijadikan sebagai data pada kolom kolom day
       EXTRACT(QUARTER FROM founded_at) AS quarter				-- ekstrak quarter dari kolom founded_at dan hasilnya dijadikan sebagai data pada kolom kolom quarter
FROM crunchbase_companies_clean_data;							-- ambil data dari tabel crunchbase_companies_clean_data

SELECT CURRENT_DATE AS date,									-- tampilkan tanggal saat ini sebagai data di kolom date
       CURRENT_TIME AS time,									-- tampilkan waktu saat ini sebagai data di kolom time
       CURRENT_TIMESTAMP AS timestamp,							-- tampilkan timestamp saat ini sebagai data di kolom timestamp
       LOCALTIME AS local_time,									-- tampilkkan localtime (waktu lokal) sebagai data di kolom local_time
       LOCALTIMESTAMP AS local_timestamp,						-- tampilkan localtimestamp (timestamp lokal) sebgai data di kolom local_timestamp
       NOW() AS now												-- tampilkan saat ini sebagai data di kolom now

SELECT founded_at,												-- ambil data dari kolom founded_at
       CURRENT_DATE AS local_time,								-- definisi/deklarasikan tanggal saat ini sebagai local_time
       CURRENT_DATE - founded_at AS founded_time_ago,			-- tanggal saat ini dikurangi data tanggal pada kolom founded_at dan hasilnya dijadikan sebagai data pada kolom founded_time_ago
       founded_at + INTERVAL '10 DAY' AS plus_10_days			-- data pada kolom founded at ditambahkan dengan 10 hari dan hasilnya dijadikan sebagai data pada kolom plus_10_days
FROM crunchbase_companies_clean_data;							-- data diambil dari tabel crunchbase_companies_clean_data

SELECT founded_at, COALESCE(founded_at, 'No Date')
FROM crunchbase_companies_clean_data;

SELECT start_time,												-- ambil data dari kolom start_time
    LEFT(start_time::TEXT, 10) AS selected_date,				-- ambil text dengan hitungan 10 karakter dari kiri dan hasilnya dijadikan sebagai data pada kolom selected_date
    RIGHT(start_time::TEXT, 8) AS selected_time,				-- ambil text dengan hitungan 8 karakter dari kanan dan hasilnya dijadikan sebagai data pada kolom selected_time 
    SUBSTRING(start_time::TEXT FROM 15 FOR 2) AS selected_minute
FROM dc_bikeshare_q1_2012;

SELECT start_time,
       RIGHT(start_time::TEXT, LENGTH(start_time::TEXT) - 11) AS selected_time
FROM dc_bikeshare_q1_2012;

SELECT bike_number,
       TRIM(leading 'W0' FROM bike_number) AS trimmed
from dc_bikeshare_q1_2012;

SELECT bike_number,
       POSITION('1' in bike_number) as pos
FROM dc_bikeshare_q1_2012;

SELECT start_station,
    LOWER(start_station) AS lowered,
    UPPER(start_station) AS uppered
FROM dc_bikeshare_q1_2012;

SELECT start_station,
       start_terminal,
       start_terminal || ' - ' || start_station AS station_id_name
FROM dc_bikeshare_q1_2012;

SELECT name, category_code, funding_total_usd,  				-- ambil nama, category_code, funding_total_usd
    CASE															-- dengan kasus
        WHEN funding_total_usd > 1000000 THEN 'High Funding'	-- ketika funding_total_usd lebih dari 1.000.000, maka catat sebagai 'High Funding'
        WHEN funding_total_usd > 100000 THEN 'Medium Funding'	-- ketika funding_total_usd kurang dari 1.000.000 dan lebih dari 100.000, maka catat sebagai 'Medium Funding'
        ELSE 'Low Funding'										-- ketika tidak masuk dalam 2 kasus di atas, maka catat sebagai 'Low Funding'
    END AS funding_category										-- menutup kasus -> jadikan sebagai kolom funding_category
FROM crunchbase_companies_clean_data;							-- ambil data dari tabel crunchbase_companies_clean_data

SELECT subquery.start_station,
       subquery.trip_count
FROM (
    SELECT start_station,
           COUNT(*) AS trip_count
    FROM dc_bikeshare_q1_2012
    GROUP BY start_station
) AS subquery
ORDER BY subquery.trip_count DESC;

SELECT name,
    status,
    region,
    founded_at
FROM crunchbase_companies_clean_data AS C
WHERE funding_total_usd IN
        (SELECT MAX(funding_total_usd)
            FROM crunchbase_companies_clean_data
            GROUP BY region
            HAVING MAX(funding_total_usd) > 1000000)
    AND founded_at IS NOT NULL;