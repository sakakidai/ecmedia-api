# Doc: https://api.rubyonrails.org/classes/ActionController/ParamsWrapper.html
# Doc: https://github.com/rails/rails/blob/main/actionpack/lib/action_controller/metal/params_wrapper.rb
# Devise auth tokenでリクエストの親エレメントない場合、Unpermitted parameterが発生することを防ぐため
ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: []
end