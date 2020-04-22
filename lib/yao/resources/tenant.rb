module Yao::Resources
  class Tenant < Base
    friendly_attributes :id, :name, :description, :enabled

    self.service        = "identity"
    self.resource_name  = "tenant"
    self.resources_name = "tenants"
    self.admin          = true
    self.return_single_on_querying = true

    def servers
      @servers ||= Yao::Server.list(all_tenants: 1, project_id: id)
    end

    def meters
      @meters ||= Yao::Meter.list({'q.field' => 'project_id', 'q.op' => 'eq', 'q.value' => id})
    end

    def ports
      @ports ||= Yao::Port.list(tenant_id: id)
    end

    def meters_by_name(meter_name)
      meters.select{|m| m.name == meter_name}
    end

    class << self
      def accessible
        as_member { self.list }
      end
      public :get_by_name
    end
  end
end
