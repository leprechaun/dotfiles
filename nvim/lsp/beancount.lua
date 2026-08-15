return {
  cmd = { 'beancount-language-server', '--stdio' },
  root_markers = { 'ledger.beancount', '.git' },
  init_options = {
    journal_file = 'ledger.beancount',
    diagnostic_flags = { '!' }, -- flags that generate warnings
    completion = {
      fuzzy_match_accounts = true, -- cross-segment fuzzy matching
    },
  },
  settings = {
    beancount = {
      formatting = {
        prefix_width = 30,
        currency_column = 60,
        number_currency_spacing = 1,
      },
    },
  },
}
