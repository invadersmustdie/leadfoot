series "my first series" do
  measure "2 seconds" do
    sleep 2
  end

  measure "fail on error" do
    raise "foo"
  end

  measure "no body"
end

series "seconds series" do
  measure "tralala" do
    sleep 1
  end
end

series "with setup" do
  setup do
    @x = 2
  end

  measure "gimme 5" do
    @x + 3
  end
end
