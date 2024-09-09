# Steam Games Analysis Project

## Project Overview

This project aims to analyze Steam game data to uncover insights into gaming trends, user behavior, and potentially develop game recommendations. The analysis is divided into two main phases: SQL-based exploration and Python-based advanced analysis.

## Goals and Methodology

### SQL Analysis

**Goal:** Perform initial data exploration and find correlations within the Steam games dataset.

**Approach:**
- Utilize PostgreSQL hosted from Docker for data storage and manipulation
- Conduct simple Exploratory Data Analysis (EDA)
- Perform data aggregation and manipulation to handle millions of rows efficiently
- Create preprocessed datasets for further analysis in Python

**Key Focus Areas:**
- User engagement trends across different game price ranges
- Platform support impact on game popularity
- Correlation between user reviews and game features

### Python Analysis

**Goal:** Conduct in-depth EDA and develop advanced analytical models.

**Planned Approach:**
- Use Jupyter Notebooks for interactive analysis and visualization
- Perform advanced statistical analysis on preprocessed data from SQL phase
- Develop machine learning models for game recommendation or trend prediction

**Future Plans:**
- Create a machine learning model for game recommendations or trend forecasting
- Containerize the final model using Docker for production deployment and scalability

## Project Structure

1. SQL Scripts: For initial data preprocessing and simple analysis
2. Jupyter Notebooks: For advanced EDA and visualization
3. Python Scripts: For implementing final models (planned)
4. Docker files: For containerization (planned)

## Data Handling

Given the large scale of the dataset, the project emphasizes efficient data handling:
- Use of SQL for initial heavy lifting and data aggregation
- Creation of optimized datasets for Python analysis
- Consideration of big data techniques for scalability

## Next Steps

- Complete in-depth Python analysis
- Develop and train machine learning models
- Implement Docker containerization for the final model
- Prepare for production deployment and scaling

---

This project is a work in progress, combining SQL efficiency for large datasets with Python's analytical power to derive meaningful insights from Steam gaming data.
