mkdir -p holdings
cd holdings

files=("ARK_AUTONOMOUS_TECH._&_ROBOTICS_ETF_ARKQ_HOLDINGS.csv" "ARK_FINTECH_INNOVATION_ETF_ARKF_HOLDINGS.csv" "ARK_GENOMIC_REVOLUTION_ETF_ARKG_HOLDINGS.csv" "ARK_INNOVATION_ETF_ARKK_HOLDINGS.csv" "ARK_NEXT_GENERATION_INTERNET_ETF_ARKW_HOLDINGS.csv" "ARK_SPACE_EXPLORATION_&_INNOVATION_ETF_ARKX_HOLDINGS.csv" "ARK_TRANSPARENCY_ETF_CTRU_HOLDINGS.csv" "ARK_ISRAEL_INNOVATIVE_TECHNOLOGY_ETF_IZRL_HOLDINGS.csv" "THE_3D_PRINTING_ETF_PRNT_HOLDINGS.csv")
for ticker in ${tickers[@]}; do
  files+=(ARK_INNOVATION_ETF_${ticker}_HOLDINGS.csv)
done

for file in ${files[@]}; do
  curl -A "ark-scraper: 6ithub.com/tigger0jk/ark-invest-scraper" https://assets.ark-funds.com/fund-documents/funds-etf-csv/$file | python3 lintCsv.py > $file
done
