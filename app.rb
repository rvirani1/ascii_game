require("sinatra")
require_relative("art")

enable :sessions

get("/") do
  session["ascii"] = random_ascii_name
  if session["score"] == nil
    session["score"] = 0
  end
  erb :index
end

post("/submission") do
  if params["guess"] == session["ascii"]
    @correct = true
    session["score"] += 1
  else
    @correct = false
    session["score"] -= 1
  end

  erb :submission
end
