{
 "metadata": {
  "version": 2,
  "www_path_prefix": "http://www.crunchbase.com/",
  "api_path_prefix": "https://api.crunchbase.com/v/2/",
  "image_path_prefix": "http://images.crunchbase.com/"
 },
 "data": {
  "uuid": "37bd05f961af726ba3c1b279da842805",
  "type": "FundingRound",
  "properties": {
   "post_money_valuation_currency_code": "USD",
   "funding_type": "private_equity",
   "money_raised_usd": 1500000000,
   "announced_on_year": 2011,
   "announced_on_day": 21,
   "announced_on_month": 1,
   "announced_on": "2011-01-21",
   "announced_on_trust_code": 7,
   "canonical_currency_code": "USD",
   "money_raised": 1500000000,
   "money_raised_currency_code": "USD",
   "permalink": "37bd05f961af726ba3c1b279da842805",
   "name": "Facebook raises 1500000000 in private_equity round",
   "created_at": 1295843747,
   "updated_at": 1398009912
  },
  "relationships": {
   "investments": {
    "paging": {
     "total_items": 2,
     "first_page_url": "https://api.crunchbase.com/v/2/funding-round/37bd05f961af726ba3c1b279da842805/investments",
     "sort_order": "created_at DESC"
    },
    "items": [
     {
      "type": "InvestorInvestment",
      "money_invested": null,
      "money_invested_currency_code": null,
      "money_invested_usd": null,
      "investor": {
       "type": "Organization",
       "name": "Digital Sky Technologies",
       "path": "organization/digital-sky-technologies-fo"
      }
     },
     {
      "type": "InvestorInvestment",
      "money_invested": null,
      "money_invested_currency_code": null,
      "money_invested_usd": null,
      "investor": {
       "type": "Organization",
       "name": "Goldman Sachs",
       "path": "organization/goldman-sachs"
      }
     }
    ]
   },
   "funded_organization": {
    "paging": {
     "total_items": 1,
     "first_page_url": "https://api.crunchbase.com/v/2/funding-round/37bd05f961af726ba3c1b279da842805/funded_organization",
     "sort_order": "created_at DESC"
    },
    "items": [
     {
      "type": "Organization",
      "name": "Facebook",
      "path": "organization/facebook",
      "created_at": 1180153335,
      "updated_at": 1408493973
     }
    ]
   },
   "news": {
    "paging": {
     "total_items": 1,
     "first_page_url": "https://api.crunchbase.com/v/2/funding-round/37bd05f961af726ba3c1b279da842805/news",
     "sort_order": "created_at DESC"
    },
    "items": [
     {
      "url": "http://www.prnewswire.com/news-releases/facebook-raises-15-billion-114383494.html",
      "author": null,
      "posted_on": null,
      "type": "PressReference",
      "title": "Facebook Raises $1.5 Billion -- PALO ALTO, Calif., Jan. 21, 2011 /PRNewswire/ --",
      "created_at": 1295843747,
      "updated_at": 1398009912
     }
    ]
   }
  }
 }
}