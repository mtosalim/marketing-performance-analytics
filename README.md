# Marketing Performance Analytics

## 🇧🇷 Visão Geral

Projeto de análise de performance de campanhas de marketing digital, com foco em geração de insights de negócio a partir de dados de mídia paga. Os dados foram extraídos de campanhas reais (Meta Ads), tratados e organizados seguindo arquitetura **Medallion (Bronze → Silver → Gold)** e explorados em dashboard no Power BI.

<img width="1294" height="733" alt="Screenshot_3" src="https://github.com/user-attachments/assets/a26144a5-c2a0-4a5f-8b2c-368f614a2639" />


## Stack Utilizada

- SQL Server (modelagem e transformação)
- Power BI (visualização)
- Python (pré-processamento pontual)
- CSV (fonte de dados)

---

## Arquitetura de Dados

### Bronze
- Dados brutos importados via `BULK INSERT`
- Sem tratamento
- Tipos como `VARCHAR`

### Silver
- Limpeza e padronização:
  - Conversão de tipos (`CAST`, `TRY_CAST`)
  - Remoção de separadores numéricos
  - Tratamento de nulos
- Dados prontos para análise

### Gold
- Camada analítica com queries focadas em negócio:
  - KPIs agregados
  - Funil de conversão
  - Performance por campanha
  - Comparação por tipo de criativo (vídeo vs imagem)
  - Análise de retenção de vídeo

---

## Principais Métricas

- Spend
- Revenue
- ROAS
- CTR
- CPC

Funil:
- Click → Add to Cart → Checkout → AddPayment Info → Checkout

---

## Principais Insights

- Campanhas com criativos em vídeo apresentaram melhor performance quando há alta retenção, com isto, a melhor coisa a se fazer seria focar em criação de novos criativos com base nos que estão performando melhor.
- Retenção de vídeo está diretamente relacionada ao ROAS.
- Diferença de eficiência entre campanhas ABO vs CBO.
- Gargalos podem identificados nas etapas finais do funil, porém comparados as métricas do mercado tradicional, o funil se encontra saudável.

---

## Estrutura do Projeto

- /data → .csv files
- /sql → .sql files
- /analytics → .pbix file

----

# 🇺🇸 Overview

Data analytics project focused on marketing campaign performance, generating business insights from paid media data.

Data was extracted from real Meta Ads campaigns, processed using a **Medallion architecture (Bronze → Silver → Gold)** and visualized in Power BI.

---

## Tech Stack

- SQL Server (data modeling & transformation)
- Power BI (dashboard & visualization)
- Python (light preprocessing)
- CSV (data source)

---

## Data Architecture

### Bronze
- Raw data ingested via `BULK INSERT`
- No transformations
- Stored as `VARCHAR`

### Silver
- Data cleaning and standardization:
  - Type conversion (`CAST`, `TRY_CAST`)
  - Removal of numeric formatting
  - Null handling
- Analysis-ready dataset

### Gold
- Business-oriented analytical layer:
  - Aggregated KPIs
  - Conversion funnel
  - Campaign performance
  - Creative analysis (video vs image)
  - Video retention analysis

---

## Key Metrics

- Spend
- Revenue
- ROAS
- CTR
- CPC

Funnel:
- Click → Add to Cart → Checkout → Add Payment Info → Conversions

---

## Key Insights

- Video campaigns perform better when retention is high, the best approach right now would be to focus on new creatives based on the best performing ones.
- Strong relationship between video retention and ROAS.
- Efficiency differences between ABO and CBO campaigns.
- Conversion drop-offs in final funnel stages, but considering the margins for the default and traditional market, the numbers are ok.

---

## Project Structure

- /data → .csv files
- /sql → .sql files
- /analytics → .pbix file
