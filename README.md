# DCA vs Lump Sum

Analysis of the buying strategies DCA (Dollar Cost Averaging) vs Lump Sum (buying it all at once, a.k.a. panic buy). Inspired by [Wicked's analysis](https://github.com/w-s-bitcoin/github-bitcoin-scripts/tree/main/Lump%20Sum%20vs%20DCA) but this is a different and simpler analysis.

## Method

We'll be using a dataset of 5 years of Bitcoin prices. Each row represents a time interval of one Bitcoin block.

Both methods assume the same dollar amount invested.

### Lump Sum

Consider the whole dollar amount to be invested all at once.

### DCA

Consider the dollar amount to be invested over `n` periods. Where `n` is the number of rows remaining in the data series. That is, the last row for DCA will be the same as the last row for Lump Sum given that `n` will be `1`.


## Results

Over the period included in the data set, the **Lump Sum strategy has shown to outperform the DCA strategy 80.28% of the time**.

## How to run

1. Install Docker
1. Run `./run.sh`
1. Open the given URL for the Jupyter Notebook
