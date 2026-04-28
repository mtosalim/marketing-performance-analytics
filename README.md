# 📊 Marketing Performance Analytics

## 🇧🇷 Sobre o projeto

Esse projeto tem como objetivo analisar a performance de campanhas e anúncios de tráfego pago de um e-commerce próprio, no modelo de dropshipping, focando em responder uma pergunta simples:

> **Quais campanhas e criativos realmente geram resultado e onde estou perdendo dinheiro?**

Os dados utilizados são reais (extraídos de campanhas no meta ads), contendo métricas como:

* investimento (ad spend)
* impressões
* cliques
* conversões
* receita
* etc

---

## Objetivos

* Identificar campanhas com melhor e pior performance (CBO, ABO)
* Entender relação entre métricas (CTR, CPC, conversão)
* Avaliar eficiência de investimento (CPA, ROAS)
* Encontrar oportunidades de otimização através da análise de dados

---

## Estrutura do projeto

O projeto segue uma estrutura inspirada em ambiente real de dados:

```
RAW → STAGING → MART
```

### Estrutura de pastas

```
/data
  /raw
  /processed

/sql
  /staging
  /marts

/analysis
```

---

## 🔧 Etapas

### 1. RAW

Dados brutos exportados das plataformas de anúncios (sem tratamento)

### 2. STAGING

* limpeza de dados
* padronização de colunas
* tratamento de nulos
* criação de métricas básicas (CTR, CPC)

### 3. MART

Criação de tabelas analíticas com foco em negócio:

* performance por campanha
* performance por anúncio

---

## Principais métricas

* **CPA (Custo por aquisição)**
* **ROAS (Retorno sobre investimento)**
* **CTR (Taxa de clique)**
* **CPC (Custo por clique)**

---

## Análises realizadas

* Ranking de campanhas por ROAS
* Identificação de campanhas com alto gasto e baixo retorno
* Relação entre CTR e conversão
* Performance de criativos (anúncios)

---

## Principais insights



---

## Limitações

* Não há identificação de usuário (customer_id)
* Não é possível calcular LTV ou churn real
* Análise focada em performance de mídia (topo e meio de funil)

---

# 🇺🇸 About the project

This project aims to analyze paid media campaign and ad performance of my e-commerce, using the business model dropshipping, focusing on answering a simple question:

> **Which campaigns and creatives actually drive results — and where am I wasting money?**

The dataset contains real campaign data, including:

* spend
* impressions
* clicks
* conversions
* revenue
* etc

---

##  Goals

* Identify top and underperforming campaigns
* Understand relationships between metrics (CTR, CPC, conversion)
* Evaluate investment efficiency (CPA, ROAS)
* Find optimization opportunities

---

## Project structure

This project follows a real-world data workflow:

```
RAW → STAGING → MART
```

---

## 🔧 Steps

### 1. RAW

Raw data exported from ad platforms (no transformation)

### 2. STAGING

* data cleaning
* column standardization
* null handling
* basic metric calculations (CTR, CPC)

### 3. MART

Business-focused analytical tables:

* campaign performance
* ad-level performance

---

## Key metrics

* **CPA (Cost per acquisition)**
* **ROAS (Return on ad spend)**
* **CTR (Click-through rate)**
* **CPC (Cost per click)**

---

## Analysis

* Top campaigns by ROAS
* High spend vs low return detection
* CTR vs conversion relationship
* Creative (ad) performance

---

## Key insights


---

## Limitations

* No user-level data (no customer_id)
* No real LTV or churn analysis
* Focused on media performance (top/mid funnel)

---
