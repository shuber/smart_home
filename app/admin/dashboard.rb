ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Temperature" do
          date_range = 5.hours.ago..Time.now
          readings = Reading.temperature.where created_at: date_range

          metrics = readings.inject({}) do |hash, reading|
            timestamp = reading.created_at.strftime("%I:%M%p")
            hash.update timestamp => reading.value
          end

          line_chart metrics, min: 70, max: 90, discrete: true
        end
      end

      column do
        panel "Todo" do
          para "What other types of charts should we add?"
        end
      end
    end
  end
end
