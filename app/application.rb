class Application

  @@items = ["Apples","Carrots","Pears"]
  @@cart = []

  def call(env)
    resp = Rack::Response.new
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    elsif req.path.match(/cart/)
      if @@cart.empty?
        resp.write "Your cart is empty"
      else
        @@cart.each {|item| resp.write "#{item}\n"}
      end
    elsif req.path.match(/add/)
      new_item = req.params["item"]
      resp.write handle_add_item(new_item)
    else
      resp.write "Path Not Found"
    end
	@@ -27,4 +37,13 @@ def handle_search(search_term)
      return "Couldn't find #{search_term}"
    end
  end

  def handle_add_item(new_item)
    if @@items.include?(new_item)
      @@cart << new_item
      return "added #{new_item}"
    else
      return "We don't have that item"
    end
  end
end
