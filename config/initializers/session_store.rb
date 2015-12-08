# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store,
  key: '_slack-forms_session_00',
  :expire_after => 1.month
