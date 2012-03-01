When /^I submit the citation "([^"]*)"$/ do |bibtex|
  token = User.first.authentication_token
  post "/citations", {"bibtex" => bibtex, "token" => token}, {"Content-type" => "application/json"}
end

When /^I submit a scrobble for "([^"]*)"$/ do |citekey|
  token = User.first.authentication_token
  payload = { "token" => token,
              "citekey" => citekey }
  post "/scrobbles", payload, {"Content-type" => "application/json"}
end

When /^I submit a link to "([^"]*)"$/ do |citekey|
  token = User.first.authentication_token
  payload = { "ref_link" => { "url" => "http://learnstream.org/wiki/ref:" + citekey },
              "citekey" => citekey,
              "token" => token }
  post "/ref_links", payload, {"Content-type" => "application/json"}
end
