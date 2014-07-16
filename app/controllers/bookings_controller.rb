class BookingsController < InheritedResources::Base
  actions :all

  def new
    super do
      resource.starts_at = Time.now.change(sec:0) - (Time.now.min % 20).minutes
    end
  end

  private

  def build_resource_params
    [params.fetch(:booking, {}).permit(:starts_at)]
  end
end
