series "my first series" do
  setup do
    @x = 2
  end

  measure "gimme 5" do
    @x + 3
  end

  measure "2 seconds" do
    sleep 2
  end

  measure "fail on error" do
    raise "foo"
  end
end
