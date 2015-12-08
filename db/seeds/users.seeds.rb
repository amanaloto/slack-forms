USER_ATTRIBUTES = [
  {:name => 'afrancisco',
    :slack_id => 'U06UPTRBJ'},
  {:name => 'amanaloto',
    :slack_id => 'U06UQKB5F'},
  {:name => 'bray',
    :slack_id => 'U06UQ9P6Y'},
  {:name => 'james-penya',
    :slack_id => 'U06USNN9X'},
  {:name => 'jancino',
    :slack_id => 'U06UQL19Q'},
  {:name => 'kbparagua',
    :slack_id => 'U06UTCXMY'},
  {:name => 'kvncruz',
    :slack_id => 'U08A2JJN5'},
  {:name => 'nzdrml',
    :slack_id => 'U06UQHNTA'},
  {:name => 'tinaalbores',
    :slack_id => 'U06UQD8D8'}
]

USER_ATTRIBUTES.each do |attrs|
  User.create attrs
end
