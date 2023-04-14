[9:18 PM, 4/13/2023] Sravani Temu: import matplotlib.pyplot as plt
[9:32 PM, 4/13/2023] Sravani Temu: import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Load diabetes dataset
diabetes = pd.read_csv('diabetes.csv')

# Define function to calculate mean, standard deviation, and percentile of BloodPressure
def calc_stats(data):
    return np.mean(data), np.std(data), np.percentile(data, 98)

# Set random seed
np.random.seed(123)

# Calculate population statistics for BloodPressure
pop_mean = np.mean(diabetes['BloodPressure'])
pop_std = np.std(diabetes['BloodPressure'])
pop_percentile = np.percentile(diabetes['BloodPressure'], 98)

# Create empty arrays to store bootstrap statistics
bootstrap_means = np.empty(500)
bootstrap_stds = np.empty(500)
bootstrap_percentiles = np.empty(500)

# Generate 500 bootstrap samples of 150 observations each and calculate statistics
for i in range(500):
    bootstrap_sample = np.random.choice(diabetes['BloodPressure'], size=150, replace=True)
    bootstrap_means[i], bootstrap_stds[i], bootstrap_percentiles[i] = calc_stats(bootstrap_sample)

# Create violin plots to compare bootstrap means, standard deviations, and percentiles to population statistics
fig, axs = plt.subplots(1, 3, figsize=(12, 6))
axs[0].violinplot(bootstrap_means, showmeans=True)
axs[0].axhline(pop_mean, color='r', linestyle='--')
axs[0].set_xticks([])
axs[0].set_ylabel('BloodPressure Mean')

axs[1].violinplot(bootstrap_stds, showmeans=True)
axs[1].axhline(pop_std, color='r', linestyle='--')
axs[1].set_xticks([])
axs[1].set_ylabel('BloodPressure Standard Deviation')

axs[2].violinplot(bootstrap_percentiles, showmeans=True)
axs[2].axhline(pop_percentile, color='r', linestyle='--')
axs[2].set_xticks([])
axs[2].set_ylabel('BloodPressure 98th Percentile')

plt.tight_layout()
plt.show()
