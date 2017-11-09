#ADMIN_EMAIL = 'admin@coinagewallet.com'
ADMIN_EMAIL = 'admin@coinxpro.com'
ADMIN_PASSWORD = 'Pass@word8'

admin_identity = Identity.find_or_create_by(email: ADMIN_EMAIL)
admin_identity.password = admin_identity.password_confirmation = ADMIN_PASSWORD
admin_identity.is_active = true
admin_identity.save!

admin_member = Member.find_or_create_by(email: ADMIN_EMAIL)
admin_member.authentications.build(provider: 'identity', uid: admin_identity.id)
admin_member.save!

if Rails.env == 'production'
  INITIAL_BTC = 1000
  INITIAL_FIAT = 1000000000
  NORMAL_PASSWORD = '1234qwer'
  EMAIL_LIST = %w(jysong@cashtree.id robin@cashtree.id kai@cashtree.id george@cashtree.id dallen@cashtree.id sheila@cashtree.id chuljung@cashtree.id danny@cashtree.id)

  EMAIL_LIST.each do |email|
    identity = Identity.create(email: email, password: NORMAL_PASSWORD, password_confirmation: NORMAL_PASSWORD, is_active: true)
    member = Member.create(email: identity.email)
    member.authentications.build(provider: 'identity', uid: foo.id)
    member.tag_list.add 'vip'
    member.tag_list.add 'hero'
    member.accounts.with_currency(:btc).first.amount = INITIAL_BTC
    member.accounts.with_currency(:cny).first.amount = INITIAL_FIAT
    member.save
  end

end

if Rails.env == 'development'
  NORMAL_PASSWORD = 'Pass@word8'

  foo = Identity.create(email: 'foo@peatio.dev', password: NORMAL_PASSWORD, password_confirmation: NORMAL_PASSWORD, is_active: true)
  foo_member = Member.create(email: foo.email)
  foo_member.authentications.build(provider: 'identity', uid: foo.id)
  foo_member.tag_list.add 'vip'
  foo_member.tag_list.add 'hero'
  foo_member.save

  bar = Identity.create(email: 'bar@peatio.dev', password: NORMAL_PASSWORD, password_confirmation: NORMAL_PASSWORD, is_active: true)
  bar_member = Member.create(email: bar.email)
  bar_member.authentications.build(provider: 'identity', uid: bar.id)
  bar_member.tag_list.add 'vip'
  bar_member.tag_list.add 'hero'
  bar_member.save
end
