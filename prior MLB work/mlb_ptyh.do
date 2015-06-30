clear
insheet using mlb_wl.csv
gen ratio = log(rs/ra)
forvalues i=1/162 {
   gen game`i' = (won >= `i')
}
reshape long game, i(team ratio)
logit game ratio, noconst

* Key is to note that since 1 predictor, no constant, we
* can either normalize the constant or normalize the variance
* Let's work with the Probit link function and instead normalize
* the var to 1, i.e. wp = log(rs)-log(ra)+u, u~N(0,1)
* If the "true" wp is WP then wp ~ (1/n)binomial(n,WP)
* Note that var((1/n)binomial(n,p)) = p(1-p)/n
* All the true WPs are in the vicinity of [.4,.6]
* so the std is around 0.04 for all of them. Have
* to divide the would-be beta by 0.04 to get the real
* beta, i.e. beta = theta/0.04 = 25*theta ~= 2
* What would theta be? Suppose runs scored per game is
* Poisson or normal or something and so is runs allowed.
* Let them be independent as a starting point. Then
* P(win) = P(rs - ra > 0) = P(log(rs)-log(ra)
*        = P(rs/ra > 1) = P(log(rs/ra)>0)
* rs ~ Normal(ms,v)
* ra ~ Normal(ma,v)
* rs - ra ~ Normal(ms-ma,2v)
* P(win) = THETA((ma-ms)/2v)
**** P(rs/ra>1) = CDF_of_ratio(1)
* marginal impact of rs, ra?
