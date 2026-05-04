
/*  
    DATA QUALITY - BRONZE
    data ingestion
*/

DROP TABLE IF EXISTS bronze.raw_campaigns;
CREATE TABLE bronze.raw_campaigns (
    report_start_date VARCHAR(50),
    report_end_date VARCHAR(50),
    campaign_name VARCHAR(255),
    campaign_status VARCHAR(50),
    adset_budget VARCHAR(50),
    budget_type VARCHAR(50),
    reach VARCHAR(50),
    impressions VARCHAR(50),
    results VARCHAR(50),
    result_type VARCHAR(100),
    cost_per_result VARCHAR(50),
    spend VARCHAR(50),
    revenue VARCHAR(50),
    add_to_cart VARCHAR(50),
    checkout_initiated VARCHAR(50),
    payment_info_added VARCHAR(50),
    roas VARCHAR(50),
    link_clicks VARCHAR(50),
    landing_page_views VARCHAR(50),
    hook_rate VARCHAR(50),
    cpc VARCHAR(50),
    ctr VARCHAR(50),
    unique_ctr VARCHAR(50),
    cpm VARCHAR(50),
    cost_lp_view VARCHAR(50),
    cost_checkout VARCHAR(50),
    cost_add_to_cart VARCHAR(50),
    post_saves VARCHAR(50),
    frequency VARCHAR(50),
    video_3sec VARCHAR(50),
    video_25 VARCHAR(50),
    video_50 VARCHAR(50),
    video_75 VARCHAR(50)
);

-- data ingestion
BULK INSERT bronze.raw_campaigns
FROM 'C:\Users\mathe\Downloads\#1 - Marketing Performance Analytics\data\raw\raw_campaigns.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    CODEPAGE = '65001',
    TABLOCK
);



/*  
    DATA QUALITY - SILVER
    cleaning + fixing datatypes
*/

DROP TABLE IF EXISTS silver.campaigns;
SELECT
    TRY_CAST(report_start_date AS DATE) AS report_start_date,
    TRY_CAST(report_end_date AS DATE) AS report_end_date,

    campaign_name,
    CASE 
    WHEN adset_budget LIKE '%Usando o orçamento%' THEN 'ABO'
    ELSE 'CBO'
    END AS adset_budget,

    COALESCE(TRY_CAST(REPLACE(REPLACE(reach, ',', ''), ' ', '') AS INT), 0) AS reach,
    COALESCE(TRY_CAST(REPLACE(REPLACE(impressions, ',', ''), ' ', '') AS INT), 0) AS impressions,
    COALESCE(TRY_CAST(REPLACE(REPLACE(results, ',', ''), ' ', '') AS INT), 0) AS results,
    COALESCE(TRY_CAST(REPLACE(REPLACE(spend, ',', '.'), ' ', '') AS DECIMAL(12,2)), 0) AS spend,
    COALESCE(TRY_CAST(REPLACE(REPLACE(revenue, ',', '.'), ' ', '') AS DECIMAL(12,2)), 0) AS revenue,
    COALESCE(TRY_CAST(REPLACE(cpc, ',', '.') AS DECIMAL(10,2)), 0) AS cpc,
    COALESCE(TRY_CAST(REPLACE(ctr, ',', '.') AS DECIMAL(10,2)), 0) AS ctr,
    COALESCE(TRY_CAST(REPLACE(cpm, ',', '.') AS DECIMAL(10,2)), 0) AS cpm,
    COALESCE(TRY_CAST(REPLACE(REPLACE(link_clicks, ',', ''), ' ', '') AS INT), 0) AS link_clicks,
    COALESCE(TRY_CAST(REPLACE(REPLACE(landing_page_views, ',', ''), ' ', '') AS INT), 0) AS landing_page_views,
    COALESCE(TRY_CAST(REPLACE(REPLACE(add_to_cart, ',', ''), ' ', '') AS INT), 0) AS add_to_cart,
    COALESCE(TRY_CAST(REPLACE(REPLACE(checkout_initiated, ',', ''), ' ', '') AS INT), 0) AS checkout_initiated,
    COALESCE(TRY_CAST(REPLACE(REPLACE(payment_info_added, ',', ''), ' ', '') AS INT), 0) AS payment_info_added,
    COALESCE(TRY_CAST(REPLACE(REPLACE(roas, ',', '.'), ' ', '') AS DECIMAL(12,2)), 0) AS roas,
    COALESCE(TRY_CAST(REPLACE(hook_rate, ',', '.') AS DECIMAL(10,2)), 0) AS hook_rate,
    COALESCE(TRY_CAST(REPLACE(frequency, ',', '.') AS DECIMAL(10,2)), 0) AS frequency,
    COALESCE(TRY_CAST(REPLACE(REPLACE(video_3sec, ',', ''), ' ', '') AS INT), 0) AS video_3sec,
    COALESCE(TRY_CAST(REPLACE(REPLACE(video_25, ',', ''), ' ', '') AS INT), 0) AS video_25,
    COALESCE(TRY_CAST(REPLACE(REPLACE(video_50, ',', ''), ' ', '') AS INT), 0) AS video_50,
    COALESCE(TRY_CAST(REPLACE(REPLACE(video_75, ',', ''), ' ', '') AS INT), 0) AS video_75

INTO silver.campaigns
FROM bronze.raw_campaigns;