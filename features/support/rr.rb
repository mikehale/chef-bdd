require 'rr'

World(RR::Adapters::RRMethods)

Before do
  RR.reset
end

After do
  begin
    RR.verify
  ensure
    RR.reset
  end
end
