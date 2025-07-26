# Energy-Consumption-Tracker-System

## Overview
This project analyzes residential electricity usage in South Carolina to help a utility company (eSC) predict and manage peak summer energy demand. The aim is to identify drivers of high electricity usage—especially in July—and use modeling to forecast future demand under hotter weather scenarios.

## Project Goals

- Predict hourly energy usage during July using machine learning models.

- Simulate energy demand under a future climate scenario (+5°F in July temperatures).

- Build an interactive Shiny app for stakeholders to explore predictions and drivers.

## Data 

- Static House Data: Info on ~5,000 single-family homes

- Energy Usage Data: Hourly energy use per house 

- Weather Data: Hourly weather by county 

- Meta Data: Descriptions of all variables across datasets


## Methodology

### 1. Data Preparation

- Loaded and merged static, usage, and weather data using R.

- Cleaned missing values, filtered July-only data, and engineered features like  energy usage, rolling means, and daily temperature stats.

### 2. Exploratory Analysis
   
- Visualized usage trends by temperature, time of day, and region. Identified key features correlated with energy spikes.

### 3. Modeling
   
- Trained multiple models (e.g., Linear Regression, Random Forest, XGBoost) to predict hourly usage.

- Selected the best-performing model based on RMSE and cross-validation.

### 4. Climate Scenario Simulation
   
- Created a modified weather dataset with July temperatures increased by 5°F. Used the trained model to predict future energy usage under this scenario.

### 5. Peak Demand Estimation
   
- Aggregated hourly predictions to estimate system-wide and region-specific peak loads. Compared results across different building attributes (e.g., home size, cooling systems).

### 6. Shiny App
   
- Built an interactive Shiny dashboard for users to explore: Hourly predictions, Usage trends by geography and building type, Peak usage simulations under climate change

## Key Findings

- Larger homes with older cooling systems show the highest projected increases under hotter conditions.

- Under a +5°F scenario, multiple counties risk breaching safe grid capacity.

## Output 

- Trained machine learning models on over 300,000 hourly records, achieving 96% accuracy in forecasting July electricity usage.

- Built an interactive R Shiny dashboard to visualize consumption patterns and simulate future demand.

- Under the +5°C temperature increase scenario, the model predicts a 27% spike in energy usage, highlighting the urgency for targeted demand reduction strategies.

## Recommendation
Introduce targeted energy-saving programs in high-risk counties during peak hours—such as smart thermostat incentives or time-of-use pricing.
