FactoryGirl.define do
  factory :citation do 
    bibtex   "@article{kirschner2006minimal, author = {Kirschner, P.A. and Sweller, J. and Clark, R.E.}, journal = {Educational psychologist}, number = {2}, pages = {75--86}, publisher = {Taylor \& Francis}, title = {Why minimal guidance during instruction does not work: An analysis of the failure of constructivist, discovery, problem-based, experiential, and inquiry-based teaching}, volume = {41}, year = {2006}}"		
    citekey  "kirschner2006minimal"
    doi      "10.1207/s15326985ep4102_1"
    title    "Why minimal guidance during instruction does not work: An analysis of the failure of constructivist, discovery, problem-based, experiential, and inquiry-based teaching"
    user
  end
end
