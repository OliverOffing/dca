---
jupyter:
  jupytext:
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.13.8
  kernelspec:
    display_name: Python 3 (ipykernel)
    language: python
    name: python3
---

```python
from pandas.testing import assert_frame_equal
import pandas as pd
df = pd.read_csv('bitcoin.csv')
df.drop(columns=['hashrate_btc', 'fee_total_btc', 'subsidy_btc'], inplace=True)
df.set_index('date', inplace=True)
df.drop_duplicates(inplace=True)
df.reindex()
```

```python
AMOUNT = 1000 # The dollar amount to be invested, either at once using Lump Sum or over n periods using DCA
```

```python
# This is an expanding backward moving average but with
# weights being iteratively calculated, defined as "amount/len(window)"
def iterative_expanding_backward_moving_average(values, amount):
    data = (values[::-1]
        .expanding(min_periods=1)
        .apply(lambda window: (amount/len(window)/window).sum(), raw=False))
    return data.reindex(index=data.index[::-1])

amount = a = 3
pd.testing.assert_series_equal(
    iterative_expanding_backward_moving_average(pd.Series([1, 10, 100]), amount),
    pd.Series([a/3/1+a/3/10+a/3/100, a/2/10+a/2/100, a/1/100]),
    check_index=False,
    check_names=False
)
```

```python
df['lump_sum'] = AMOUNT / df['price_btc']
df
```

```python
df['dca'] = iterative_expanding_backward_moving_average(df['price_btc'], AMOUNT)
```

```python
df
```

```python
# How many times is the meadian return of Lump Sum strategy greater than the DCA strategy?
df[df['lump_sum'] > df['dca']].index.size / df.index.size
```

```python
df['price_btc_adjusted'] = df['price_btc'] / 50000
df[['price_btc_adjusted', 'lump_sum', 'dca']].plot()
```

```python
# Zooming in
df[-600:][['lump_sum', 'dca']].plot()
```
