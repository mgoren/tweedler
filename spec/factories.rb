FactoryGirl.define do
  factory(:user) do
    email('test@user.com')
    password('password')
  end

  factory(:tweed) do
    body('this is a tweed!')
  end
end
