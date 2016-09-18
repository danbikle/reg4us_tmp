# backtest_rpt.py

# This script should report on results of a backtest for a year.

# This script should be called from ~/reg4us/script/backtest.bash

# Demo:
# ~/anaconda3/bin/python backtest_rpt.py 2001

import numpy  as np
import pandas as pd
import pdb

# I should check cmd line args
import sys
if (len(sys.argv) != 2):
  print('You typed something wrong:')
  print('Demo:')
  print("~/anaconda3/bin/python ~/anaconda3/bin/python backtest_rpt.py 2001")
  sys.exit()
  
yr = sys.argv[1]
bt_df = pd.read_csv('../public/csv/backtest_'+yr+'.csv')

# I should report long-only-effectiveness:
eff_lo_f = np.sum(bt_df.pctlead)

# I should report Linear-Regression-Effectiveness:
eff_sr     = bt_df.pctlead * np.sign(bt_df.pred_linr)
bt_df['eff_linr'] = eff_sr
eff_linr_f                 = np.sum(eff_sr)

# I should report Logistic-Regression-Effectiveness:
eff_sr     = bt_df.pctlead * np.sign(bt_df.pred_logr - 0.5)
bt_df['eff_logr'] = eff_sr
eff_logr_f                 = np.sum(eff_sr)

# print('yr: '+yr)
# print(bt_df.head())
# print(bt_df.tail())
print('Long-Only-Effectiveness: '          +str(eff_lo_f))
print('Linear-Regression-Effectiveness: '  +str(eff_linr_f))
print('Logistic-Regression-Effectiveness: '+str(eff_logr_f))

'bye'
