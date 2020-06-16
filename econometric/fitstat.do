capture log close
set more off
log using fitstat, replace
tsfn
*
* Examples for the STB article on fitstat
* Scott Long and Jeremy Freese
*
use mroz, clear
* compute fit statistics for a single model
logit lfp k5 k618 age wc hc lwg inc
fitstat
* compute  fit statistics for a single model and save fit measures
logit lfp k5 k618 age wc hc lwg inc
fitstat, saving(mod1)
* compare saved model to current model
logit lfp k5 age age2 wc inc
fitstat, using(mod1) saving(mod2)
* compare models with bic statistics
logit lfp k5 age age2 wc inc
fitstat, using(mod1) bic

log close

