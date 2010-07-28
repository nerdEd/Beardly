When /^twitter authentication is successful$/ do
  visit twitter_login_path, :oauth_verifier => 'fakeverifierstringhere'
end
