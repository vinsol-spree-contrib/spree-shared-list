Deface::Override.new(
  virtual_path: 'spree/users/show',
  name: 'add_sharedlist_to_my_account',
  insert_after: "[data-hook='account_my_orders']",
  partial: 'spree/users/sharedlists'
)
