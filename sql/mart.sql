
/*  
    DATA QUALITY - GOLD
    KPIs, funnels, performances, retention
*/

SELECT *
FROM silver.campaigns;

CREATE VIEW gold.campaign_performance AS
SELECT
    campaign_name,
    adset_budget,
    SUM(spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(revenue) / NULLIF(SUM(spend),0) AS roas,
    SUM(link_clicks) AS clicks,
    SUM(impressions) AS impressions
FROM silver.campaigns
GROUP BY campaign_name, adset_budget;


-- KPI by ABO or CBO
SELECT
	adset_budget,
	SUM(revenue) AS total_revenue,
	SUM(spend) AS total_spend,
    SUM(revenue) / NULLIF(SUM(spend), 0) AS roas,
    SUM(link_clicks) as total_clicks,
    SUM(add_to_cart) as total_addtocart,
    SUM(checkout_initiated) as total_checkout,
    SUM(payment_info_added) as total_addpaymentinfo
FROM silver.campaigns
GROUP BY adset_budget;

-- Funil de conversão by ABO or CBO
SELECT
    adset_budget,
    SUM(link_clicks) AS clicks,
    SUM(add_to_cart) AS add_to_cart,
    SUM(checkout_initiated) AS checkout,
    SUM(payment_info_added) AS payment
FROM silver.campaigns
GROUP BY adset_budget;


-- Performance por campanha
SELECT
    campaign_name,
    SUM(spend) AS spend,
    SUM(revenue) AS revenue,
    SUM(revenue) / NULLIF(SUM(spend),0) AS roas
FROM silver.campaigns
GROUP BY campaign_name;


-- Performance por tipo de criativo, vídeo ou imagem
SELECT
    *,
    CASE 
        WHEN video_3sec > 0 THEN 'Video'
        ELSE 'Image'
    END AS ad_type
FROM silver.campaigns;

SELECT 
    adtype,
    SUM(revenue) as total_revenue,
    SUM(spend) as total_spent,
    SUM(revenue) / NULLIF(SUM(spend), 0) as total_roas,
    SUM(link_clicks) * 1.0 / NULLIF(SUM(impressions), 0) AS total_ctr,
    ROUND(SUM(spend) / NULLIF(SUM(link_clicks), 0), 2) AS total_cpc
FROM (
SELECT 
    *,
    CASE WHEN video_3sec > 0 THEN 'Video'
    ELSE 'Image'
    END as adtype
FROM silver.campaigns)t
GROUP BY adtype;


-- Taxa de retenção dos vídeos

SELECT 
    adset_budget,
    SUM(video_3sec) AS video3sec,
    SUM(video_25) AS video25p,
    SUM(video_50) AS video50p,
    SUM(video_75) AS video75p,

    SUM(video_25) * 1.0 / NULLIF(SUM(video_3sec), 0) as retention25,
    SUM(video_50) * 1.0 / NULLIF(SUM(video_3sec), 0) as retention50,
    SUM(video_75) * 1.0 / NULLIF(SUM(video_3sec), 0) as retention75,
    SUM(revenue) / NULLIF(SUM(spend), 0) as roas
FROM silver.campaigns
WHERE video_3sec > 0
GROUP BY adset_budget;


-- Retenção vs Performance para anúncios de vídeo

SELECT
    retentions,
    SUM(revenue) as total_revenue,
    SUM(spend) as total_spent,
    SUM(revenue) / NULLIF(SUM(spend), 0) as roas

FROM (
    SELECT
       *,
       CASE WHEN video_75 * 1.0 / NULLIF(video_3sec, 0) > 0.3 THEN 'Alta retenção'
       ELSE 'Baixa Retenção'
       END as retentions
    FROM silver.campaigns)t
GROUP BY retentions;
