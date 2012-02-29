When /^I submit the citation "([^"]*)"$/ do |bibtex|
  post "/citations", {"bibtex" => bibtex}, {"Content-type" => "application/json"}
end

When /^I submit a scrobble for "([^"]*)"$/ do |citekey|
  payload = { "scrobble" => { "user_id" => 1 },
               "citekey" => citekey }
  post "/scrobbles", payload, {"Content-type" => "application/json"}
end

When /^I submit a link to "([^"]*)"$/ do |citekey|
  payload = { "ref_link" => { "user_id" => 1,
                              "url" => "http://learnstream.org/wiki/ref:" + citekey },
              "citekey" => citekey }
  post "/ref_links", payload, {"Content-type" => "application/json"}
end
