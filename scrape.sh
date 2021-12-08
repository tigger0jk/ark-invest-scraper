mkdir -p holdings
cd holdings

tickers=("ARKK" "ARKQ" "ARKW" "ARKG" "ARKF" "PRNT" "IZRL" "ARKX")

files=("ARK_TRANSPARENCY_ETF_CTRU_HOLDINGS.csv")
for ticker in ${tickers[@]}; do
  files+=(ARK_INNOVATION_ETF_${ticker}_HOLDINGS.csv)
done

for file in ${files[@]}; do
  curl -A "ark-scraper: 6ithub.com/tigger0jk/ark-invest-scraper" https://ark-funds.com/wp-content/uploads/funds-etf-csv/$file | python3 lintCsv.py > $file
done
