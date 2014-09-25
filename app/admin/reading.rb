ActiveAdmin.register Reading do
  permit_params :sensor_id, :value, :created_at

  controller do
    skip_before_filter :verify_authenticity_token, only: :create
  end
end
