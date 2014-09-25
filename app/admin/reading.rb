ActiveAdmin.register Reading do
  permit_params :sensor_id, :value, :created_at

  index do
    column :id
    column :sensor
    column :value
    column :created_at
    column :updated_at

    actions
  end

  controller do
    skip_before_filter :verify_authenticity_token, only: :create
  end
end
