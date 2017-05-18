Rails.application.routes.draw do


  # 上面的覆盖下面
  # 前缀域名地址：wwww.tchautchau.cn
  # 接口示例： www.tchautchau.cn/api/users 即可返回所有用户的json数据
  # 有‘:’的参数，例如':id' 为前台需要传递的用户id的参数

  # 用户 登录 接口
  post '/api/users/login', to:'users#login', format:'json'#参数：telphone，password

  # 用户 注册 接口
  post '/api/users', to:'users#create', format:'json'#参数：username, telphone, password

  # 取送人员 登录 接口
  post '/api/couriers/login', to:'couriers#login', format:'json'#参数：telphone，password

  # 取送人员 注册 接口
  post '/api/couriers', to:'couriers#create', format:'json'#参数：username, telphone, password
  
  # 加工商 登录 接口
  post '/api/factories/login', to:'factories#login', format:'html'#参数：telphone，password

  # 加工商 注册 接口
  post '/api/factories', to:'factories#create', format:'json'#参数：username, telphone, password

  # 运营人员 登录 接口
  post '/api/operators/login', to:'operators#login', format:'json'#参数：telphone，password

  # 运营人员 注册 接口
  post '/api/operators', to:'operators#create', format:'json'#参数：username, telphone, password


  # 品类－城市 相关接口 categories_cities 
  # 显示 ‘所有 品类－城市‘
  get '/api/categories_cities', to: 'categories_cities#index', format: 'json'

  # 显示 ‘某个 品类－城市‘
  get '/api/categories_cities/:id', to: 'categories_cities#show', format: 'json'

  # 显示 ’某个 城市' 的 '品类－城市‘
  get '/api/cities/:city_id/categories_cities', to: 'categories_cities#categoriesbycity', format: 'json'

  # 添加 ‘某个 品类－城市‘
  post '/api/categories_cities', to: 'categories_cities#create', format: 'json'

  # 更新 ‘某个 品类－城市‘
  put '/api/categories_cities/:id' ,to: 'categories_cities#update', format: 'json'
  post '/api/update/categories_cities/:id' ,to: 'categories_cities#update', format: 'json'

  # 删除 ‘某个 品类－城市‘
  delete '/api/categories_cities/:id' ,to: 'categories_cities#delete', format: 'json'
  post '/api/delete/categories_cities/:id' ,to: 'categories_cities#delete', format: 'json'
  resources :categories_cities


  # 品类 相关接口 category
  # 显示 ‘所有品类’
  get '/api/categories', to: 'categories#index', format: 'json'

  # 显示 ‘某个品类’
  get '/api/categories/:id', to: 'categories#show', format: 'json'

  # 添加 ‘某个品类’
  post '/api/categories', to: 'categories#create', format: 'json'

  # 更新 ‘某个品类’
  put '/api/categories/:id', to: 'categories#update', format: 'json'
  post '/api/update/categories/:id', to: 'categories#update', format: 'json'

  # 删除 ‘某个品类’
  delete '/api/categories/:id' ,to: 'categories#destroy', format: 'json'
  post '/api/delete/categories/:id' ,to: 'categories#destroy', format: 'json'
  resources :categories


  # 城市 相关接口 city
  # 显示 ‘所有城市’
  get '/api/cities', to: 'cities#index', format: 'json'

  # 显示 ‘某个城市’
  get '/api/cities/:id', to: 'cities#show', format: 'json'

  # 添加 ‘某个城市’
  post '/api/cities', to: 'cities#create', format: 'json'

  # 更新 ‘某个城市’
  put '/api/cities/:id' ,to: 'cities#update', format: 'json'
  post '/api/update/cities/:id' ,to: 'cities#update', format: 'json'

  # 删除 ‘某个城市’
  delete '/api/cities/:id' ,to: 'cities#delete', format: 'json'
  post '/api/delete/cities/:id' ,to: 'cities#delete', format: 'json'
  resources :cities


  # 优惠券－城市 相关接口 coupon_cities
  # 显示 ‘所有 优惠券－城市‘
  get '/api/coupon_cities', to: 'coupon_cities#index', format: 'json'

  # 显示 ‘某个 优惠券－城市’
  get '/api/coupon_cities/:id', to: 'coupon_cities#show', format: 'json'

  # 显示 ’某个城市' 的 '优惠券－城市‘
  get '/api/cities/:city_id/coupon_cities', to: 'coupon_cities#couponsbycity', format: 'json'

  # 添加 ‘某个 优惠券－城市’
  post '/api/coupon_cities', to: 'coupon_cities#create', format: 'json'

  # 更新 ‘某个 优惠券－城市‘
  put '/api/coupon_cities/:id' ,to: 'coupon_cities#update', format: 'json'
  post '/api/update/coupon_cities/:id' ,to: 'coupon_cities#update', format: 'json'

  # 删除 ‘某个 优惠券－城市’
  delete '/api/coupon_cities/:id' ,to: 'coupon_cities#delete', format: 'json'
  post '/api/delete/coupon_cities/:id' ,to: 'coupon_cities#delete', format: 'json'
  resources :coupon_cities


  # 优惠券－优惠券类型 相关接口 coupon_coupontypes
  # 显示 ‘所有 优惠券－优惠券类型‘
  get '/api/coupon_coupontypes', to: 'coupon_coupontypes#index', format: 'json'

  # 显示 ‘某个 优惠券－优惠券类型’
  get '/api/coupon_coupontypes/:id', to: 'coupon_coupontypes#show', format: 'json'

  # 显示 ’某个 优惠券类型' 的 '优惠券规则－城市’
  get '/api/coupon_types/:coupon_type_id/coupon_coupontypes', to: 'coupon_coupontypes#coupontypesbycoupontype', format: 'json'

  # 添加 ‘某个 优惠券－优惠券类型’
  post '/api/coupon_coupontypes', to: 'coupon_coupontypes#create', format: 'json'

  # 更新 ‘某个 优惠券－优惠券类型‘
  put '/api/coupon_coupontypes/:id' ,to: 'coupon_coupontypes#update', format: 'json'
  post '/api/update/coupon_coupontypes/:id' ,to: 'coupon_coupontypes#update', format: 'json'

  # 删除 ‘某个 优惠券－优惠券类型’
  delete '/api/coupon_coupontypes/:id' ,to: 'coupon_coupontypes#delete', format: 'json'
  post '/api/delete/coupon_coupontypes/:id' ,to: 'coupon_coupontypes#delete', format: 'json'
  resources :coupon_coupontypes


  # 优惠券类型 相关接口 coupon_statuses
  # 显示 ‘所有 优惠券类型‘
  get '/api/coupon_statuses', to: 'coupon_statuses#index', format: 'json'

  # 显示 ‘某个 优惠券类型‘
  get '/api/coupon_statuses/:id', to: 'coupon_statuses#show', format: 'json'

  # 添加 ‘某个 优惠券类型‘
  post '/api/coupon_statuses', to: 'coupon_statuses#create', format: 'json'

  # 更新 ‘某个 优惠券类型‘
  put '/api/coupon_statuses/:id' ,to: 'coupon_statuses#update', format: 'json'
  post '/api/update/coupon_statuses/:id' ,to: 'coupon_statuses#update', format: 'json'

  # 删除 ‘某个 优惠券类型‘
  delete '/api/coupon_statuses/:id' ,to: 'coupon_statuses#delete', format: 'json'
  post '/api/delete/coupon_statuses/:id' ,to: 'coupon_statuses#delete', format: 'json'
  resources :coupon_statuses


  # 优惠券类型 相关接口 coupon_types
  # 显示 ‘所有 优惠券类型‘
  get '/api/coupon_types', to: 'coupon_types#index', format: 'json'

  # 显示 ‘某个 优惠券类型‘
  get '/api/coupon_types/:id', to: 'coupon_types#show', format: 'json'

  # 添加 ‘某个 优惠券类型‘
  post '/api/coupon_types', to: 'coupon_types#create', format: 'json'

  # 更新 ‘某个 优惠券类型‘
  put '/api/coupon_types/:id' ,to: 'coupon_types#update', format: 'json'
  post '/api/update/coupon_types/:id' ,to: 'coupon_types#update', format: 'json'

  # 删除 ‘某个 优惠券类型‘
  delete '/api/coupon_types/:id' ,to: 'coupon_types#delete', format: 'json'
  post '/api/delete/coupon_types/:id' ,to: 'coupon_types#delete', format: 'json'
  resources :coupon_types


  # 优惠券规则－城市 相关接口 couponrule_cities
  # 显示 ‘所有 优惠券－城市‘
  get '/api/couponrule_cities', to: 'couponrule_cities#index', format: 'json'

  # 显示 ‘某个 优惠券规则－城市‘
  get '/api/couponrule_cities/:id', to: 'couponrule_cities#show', format: 'json'

  # 显示 ’某个城市' 的 '优惠券规则－城市’
  get '/api/cities/:city_id/couponrule_cities', to: 'couponrule_cities#couponrulesbycity', format: 'json'

  # 添加 ‘某个 优惠券规则－城市‘
  post '/api/couponrule_cities', to: 'couponrule_cities#create', format: 'json'

  # 更新 ‘某个 优惠券规则－城市’
  put '/api/couponrule_cities/:id' ,to: 'couponrule_cities#update', format: 'json'
  post '/api/update/couponrule_cities/:id' ,to: 'couponrule_cities#update', format: 'json'

  # 删除 ‘某个 优惠券规则－城市‘
  delete '/api/couponrule_cities/:id' ,to: 'couponrule_cities#delete', format: 'json'
  post '/api/delete/couponrule_cities/:id' ,to: 'couponrule_cities#delete', format: 'json'
  resources :couponrule_cities


  # 优惠券 相关借口 coupon
  # 显示 ‘所有优惠券’
  get '/api/coupons', to: 'coupons#index', format: 'json'

  # 显示 ‘某个优惠券’
  get '/api/coupons/:id', to: 'coupons#show', format: 'json'

  # 添加 ‘某个优惠券’
  post '/api/coupons', to: 'coupons#create', format: 'json'

  # 更新 ‘某个优惠券’
  put '/api/coupons/:id' ,to: 'coupons#update', format: 'json'
  post '/api/update/coupons/:id' ,to: 'coupons#update', format: 'json'

  # 删除 ‘某个优惠券’
  delete '/api/coupons/:id' ,to: 'coupons#delete', format: 'json'
  post '/api/delete/coupons/:id' ,to: 'coupons#delete', format: 'json'
  resources :coupons


  # 优惠券－用户 相关接口 coupons_users
  # 显示 ‘所有 优惠券－用户‘
  get '/api/coupons_users', to: 'coupons_users#index', format: 'json'

  # 显示 ‘某个 优惠券－用户‘
  get '/api/coupons_users/:id', to: 'coupons_users#show', format: 'json'

  # 显示 ’某个 用户' 的 '所有优惠券‘
  get '/api/users/:user_id/coupons_users', to: 'coupons_users#couponsbyuser', format: 'json'

  # 添加 ‘某个 优惠券－用户‘
  post '/api/coupons_users', to: 'coupons_users#create', format: 'json'

  # 更新 ‘某个 优惠券－用户‘
  put '/api/coupons_users/:id' ,to: 'coupons_users#update', format: 'json'
  post '/api/update/coupons_users/:id' ,to: 'coupons_users#update', format: 'json'

  # 删除 ‘某个 优惠券－用户‘
  delete '/api/coupons_users/:id' ,to: 'coupons_users#delete', format: 'json'
  post '/api/delete/coupons_users/:id' ,to: 'coupons_users#delete', format: 'json'
  resources :coupons_users


  # 取送员－城市 相关接口 courier_cities
  # 显示 ‘所有 取送员－城市‘
  get '/api/courier_cities', to: 'courier_cities#index', format: 'json'

  # 显示 ‘某个 取送员－城市’
  get '/api/courier_cities/:id', to: 'courier_cities#show', format: 'json'

  # 显示 ’某个城市' 的 '取送员－城市’
  get '/api/cities/:city_id/courier_cities', to: 'courier_cities#couriersbycity', format: 'json'

  # 添加 ‘某个 取送员－城市‘
  post '/api/courier_cities', to: 'courier_cities#create', format: 'json'

  # 更新 ‘某个 取送员－城市’
  put '/api/courier_cities/:id' ,to: 'courier_cities#update', format: 'json'
  post '/api/update/courier_cities/:id' ,to: 'courier_cities#update', format: 'json'

  # 删除 ‘某个 取送员－城市‘
  delete '/api/courier_cities/:id' ,to: 'courier_cities#delete', format: 'json'
  post '/api/delete/courier_cities/:id' ,to: 'courier_cities#delete', format: 'json'
  resources :courier_cities


  # 取送员－驿站 相关接口 courier_stations
  # 显示 ‘所有 取送员－驿站‘
  get '/api/courier_stations', to: 'courier_stations#index', format: 'json'

  # 显示 ‘某个 取送员－驿站‘
  get '/api/courier_stations/:id', to: 'courier_stations#show', format: 'json'

  # 显示 ’某个 驿站' 的 '取送员－驿站‘
  get '/api/stations/:station_id/courier_stations', to: 'courier_stations#couriersbystation', format: 'json'

  # 添加 ‘某个 取送员－驿站‘
  post '/api/courier_stations', to: 'courier_stations#create', format: 'json'

  # 更新 ‘某个 取送员－驿站‘
  put '/api/courier_stations/:id' ,to: 'courier_stations#update', format: 'json'
  post '/api/update/courier_stations/:id' ,to: 'courier_stations#update', format: 'json'

  # 删除 ‘某个 取送员－驿站‘
  delete '/api/courier_stations/:id' ,to: 'courier_stations#delete', format: 'json'
  post '/api/delete/courier_stations/:id' ,to: 'courier_stations#delete', format: 'json'
  resources :courier_stations


  # 取送员 相关接口 courier
  # 显示 ‘所有取送员’
  get '/api/couriers', to: 'couriers#index', format: 'json'

  # 显示 ‘某个取送员’
  get '/api/couriers/:id', to: 'couriers#show', format: 'json'

  # 添加 ‘某个取送员’
  post '/api/couriers', to: 'couriers#create', format: 'json'

  # 更新 ‘某个取送员’
  put '/api/couriers/:id' ,to: 'couriers#update', format: 'json'
  post '/api/update/couriers/:id' ,to: 'couriers#update', format: 'json'

  # 删除 ‘某个取送员’
  delete '/api/couriers/:id' ,to: 'couriers#delete', format: 'json'
  post '/api/delete/couriers/:id' ,to: 'couriers#delete', format: 'json'
  resources :couriers


  # 加工端 相关接口 factory
  # 显示 ’所有加工端‘
  get '/api/factories', to: 'factories#index', format: 'json'

  # 显示 ’某个加工端‘
  get '/api/factories/:id', to: 'factories#show', format: 'json'

  # 添加 ‘某个加工端’
  post '/api/factories', to: 'factories#create', format: 'json'

  # 更新 ‘某个加工端’
  put '/api/factories/:id' ,to: 'factories#update', format: 'json'
  post '/api/update/factories/:id' ,to: 'factories#update', format: 'json'

  # 删除 ‘某个加工端’
  delete '/api/factories/:id' ,to: 'factories#delete', format: 'json'
  post '/api/delete/factories/:id' ,to: 'factories#delete', format: 'json'
  resources :factories


  # 加工端－城市 相关接口 factory_cities
  # 显示 ‘所有 加工端－城市’
  get '/api/factory_cities', to: 'factory_cities#index', format: 'json'

  # 显示 ‘某个 加工端－城市’
  get '/api/factory_cities/:id', to: 'factory_cities#show', format: 'json'

  # 显示 ’某个城市' 的 '加工端－城市’
  get '/api/cities/:city_id/factory_cities', to: 'factory_cities#factoriesbycity', format: 'json'

  # 添加 ‘某个 加工端－城市’
  post '/api/factory_cities', to: 'factory_cities#create', format: 'json'

  # 更新 ‘某个 加工端－城市’
  put '/api/factory_cities/:id' ,to: 'factory_cities#update', format: 'json'
  post '/api/update/factory_cities/:id' ,to: 'factory_cities#update', format: 'json'

  # 删除 ‘某个 加工端－城市’
  delete '/api/factory_cities/:id' ,to: 'factory_cities#delete', format: 'json'
  post '/api/delete/factory_cities/:id' ,to: 'factory_cities#delete', format: 'json'
  resources :factory_cities


  # 收入状态 相关接口 income_statuses
  # 显示 ‘所有 收入状态’
  get '/api/income_statuses', to: 'income_statuses#index', format: 'json'

  # 显示 ‘某个 收入状态’
  get '/api/income_statuses/:id', to: 'income_statuses#show', format: 'json'

  # 添加 ‘某个 收入状态’
  post '/api/income_statuses', to: 'income_statuses#create', format: 'json'

  # 更新 ‘某个 收入状态’
  put '/api/income_statuses/:id' ,to: 'income_statuses#update', format: 'json'
  post '/api/update/income_statuses/:id' ,to: 'income_statuses#update', format: 'json'

  # 删除 ‘某个 收入状态’
  delete '/api/income_statuses/:id' ,to: 'income_statuses#delete', format: 'json'
  post '/api/delete/income_statuses/:id' ,to: 'income_statuses#delete', format: 'json'
  resources :income_statuses


  # 订单单项－产品 相关接口 items_products
  # 显示 ‘所有 订单单项－产品‘
  get '/api/items_products', to: 'items_products#index', format: 'json'

  # 显示 ‘某个 订单单项－产品‘
  get '/api/items_products/:id', to: 'items_products#show', format: 'json'

  # 显示 ’某个 产品' 的 '订单单项－产品‘
  get '/api/products/:product_id/items_products', to: 'items_products#itemsbyproduct', format: 'json'

  # 显示 ’某个 物流状态' 的 '订单单项－产品‘
  get '/api/logistics/:logistics_id/items_products', to: 'items_products#itemsbylogistics', format: 'json'

  # 添加 ‘某个 订单单项－产品‘
  post '/api/items_products', to: 'items_products#create', format: 'json'

  # 更新 ‘某个 订单单项－产品‘
  put '/api/items_products/:id' ,to: 'items_products#update', format: 'json'
  post '/api/update/items_products/:id' ,to: 'items_products#update', format: 'json'

  # 删除 ‘某个 订单单项－产品‘
  delete '/api/items_products/:id' ,to: 'items_products#delete', format: 'json'
  post '/api/delete/items_products/:id' ,to: 'items_products#delete', format: 'json'
  resources :items_products


  # 物流 相关接口 logistics
  # 显示 ‘所有区域’
  get '/api/logistics', to: 'logistics#index', format: 'json'

  # 显示 ‘某个物流’
  get '/api/logistics/:id', to: 'logistics#show', format: 'json'

  # 添加 ‘某个物流’
  post '/api/logistics', to: 'logistics#create', format: 'json'

  # 更新 ‘某个物流’
  put '/api/logistics/:id' ,to: 'logistics#update', format: 'json'
  post '/api/update/logistics/:id' ,to: 'logistics#update', format: 'json'

  # 删除 ‘某个物流’
  delete '/api/logistics/:id' ,to: 'logistics#delete', format: 'json'
  post '/api/delete/logistics/:id' ,to: 'logistics#delete', format: 'json'
  resources :logistics


  # 运营人员－权限 相关接口 operator_permissions
  # 显示 ‘所有 运营人员－权限’
  get '/api/operator_permissions/:id', to: 'operator_permissions#index', format: 'json'

  # 显示 ‘某个 运营人员－权限’
  get '/api/operator_permissions', to: 'operator_permissions#show', format: 'json'

  # 添加 ‘某个 运营人员－权限’
  post '/api/operator_permissions', to: 'operator_permissions#create', format: 'json'

  # 更新 ‘某个 运营人员－权限’
  put '/api/operator_permissions/:id' ,to: 'operator_permissions#update', format: 'json'
  post '/api/update/operator_permissions/:id' ,to: 'operator_permissions#update', format: 'json'

  # 删除 ‘某个 运营人员－权限’
  delete '/api/operator_permissions/:id' ,to: 'operator_permissions#delete', format: 'json'
  post '/api/delete/operator_permissions/:id' ,to: 'operator_permissions#delete', format: 'json'
  resources :operator_permissions

  
  # 运营人员 相关接口 operator
  # 显示 ‘所有运营人员’
  get '/api/operators', to: 'operators#index', format: 'json'

  # 显示 ‘某个运营人员’
  get '/api/operators/:id', to: 'operators#show', format: 'json'

  # 添加 ‘某个运营人员’
  post '/api/operators', to: 'operators#create', format: 'json'

  # 更新 ‘某个运营人员’
  put '/api/operators/:id' ,to: 'operators#update', format: 'json'
  post '/api/update/operators/:id' ,to: 'operators#update', format: 'json'

  # 删除 ‘某个运营人员’
  delete '/api/operators/:id' ,to: 'operators#delete', format: 'json'
  post '/api/delete/operators/:id' ,to: 'operators#delete', format: 'json'
  resources :operators


  # 订单项 相关接口 order_item
  # 显示 ‘所有订单项’
  get '/api/order_items', to: 'order_items#index', format: 'json'

  # 显示 ‘某个订单项’
  get '/api/order_items/:id', to: 'order_items#show', format: 'json'

  # 添加 ‘某个订单项’
  post '/api/order_items', to: 'order_items#create', format: 'json'

  # 显示 ‘某个订单’ 的 ‘所有’ ‘订单项’
  get '/api/orders/:order_id/order_items', to: 'order_items#orderitemsbyorder', format: 'json'

  # 更新 ‘某个订单项’
  put '/api/order_items/:id' ,to: 'order_items#update', format: 'json'
  post '/api/update/order_items/:id' ,to: 'order_items#update', format: 'json'

  # 删除 ‘某个订单项’
  delete '/api/order_items/:id' ,to: 'order_items#destroy', format: 'json'
  post '/api/delete/order_items/:id' ,to: 'order_items#destroy', format: 'json'
  resources :order_items


  # 订单 相关接口 order （订单状态包括 0:未取单 1:进行中 2:已完成）
  # 显示 ‘所有用户’ 的 ‘所有订单’
  get '/api/orders', to: 'orders#index', format: 'json' 

  # 显示 ‘某个订单’
  get 'api/orders/:id', to: 'orders#show', format: 'json'

  # 显示 ‘某个用户’ 下的 ‘所有订单’
  get '/api/users/:user_id/orders', to: 'orders#ordersbyuser' ,format: 'json'

  # 显示 ‘某种物流状态’ 下的 ‘所有订单’ 
  get '/api/statuses/:status/orders', to: 'orders#ordersbystatus' ,format: 'json'

  # 显示 ‘某个用户’的‘某种物流状态’ 的 ‘所有订单’ 用户端 0:未取单 1:进行中 2:已完成
  get '/api/users/:user_id/logistics/:logistics_id/orders', to: 'orders#ordersbyuserandlogistics', format: 'json'

  # 显示 ‘某个取送员’ 的 ‘所有订单’
  get '/api/couriers/:courier_id/orders', to: 'orders#ordersbycourier', format: 'json'

  # 显示 ‘某个工厂’ 的 ‘所有订单’
  get '/api/factories/:factory_id/orders', to: 'orders#ordersbyfactory', format: 'json'

  # 显示 ‘某个工厂’ 的 '某个驿站' 的 ‘某个状态’ 的 ‘所有订单’
  get '/api/factories/:factory_id/stations/:station_id/logistics/:logistics_id/orders', to: 'orders#ordersbyfactoryandstationandlogistics', format: 'json'

  # 添加 ‘某个订单’
  post '/api/orders', to: 'orders#create', format: 'json'

  # 更新 ‘某个订单’
  put '/api/orders/:id' ,to: 'orders#update', format: 'json'
  post '/api/update/orders/:id' ,to: 'orders#update', format: 'json'

  # 删除 ‘某个订单’
  delete '/api/orders/:id' ,to: 'orders#destroy', format: 'json'
  post '/api/delete/orders/:id' ,to: 'orders#destroy', format: 'json'
  resources :orders


  # 支付状态 相关接口 pay_statuses
  # 显示 ‘所有 支付状态‘
  get '/api/pay_statuses', to: 'pay_statuses#index', format: 'json'

  # 显示 ‘某个 支付状态‘
  get '/api/pay_statuses/:id', to: 'pay_statuses#show', format: 'json'

  # 添加 ‘某个 支付状态‘
  post '/api/pay_statuses', to: 'pay_statuses#create', format: 'json'

  # 更新 ‘某个 支付状态‘
  put '/api/pay_statuses/:id' ,to: 'pay_statuses#update', format: 'json'
  post '/api/update/pay_statuses/:id' ,to: 'pay_statuses#update', format: 'json'

  # 删除 ‘某个 支付状态‘
  delete '/api/pay_statuses/:id' ,to: 'pay_statuses#delete', format: 'json'
  post '/api/delete/pay_statuses/:id' ,to: 'pay_statuses#delete', format: 'json'
  resources :pay_statuses


  # 企业端用户权限 相关接口 permissions
  # 显示 ‘所有 权限’
  get '/api/permissions', to: 'permissions#index', format: 'json'

  # 显示 ‘某个 权限’
  get '/api/permissions/:id', to: 'permissions#show', format: 'json'

  # 添加 ‘某个 权限’
  post '/api/permissions', to: 'permissions#create', format: 'json'

  # 更新 ‘某个 权限’
  put '/api/permissions/:id' ,to: 'permissions#update', format: 'json'
  post '/api/update/permissions/:id' ,to: 'permissions#update', format: 'json'

  # 删除 ‘某个 权限’
  delete '/api/permissions/:id' ,to: 'permissions#delete', format: 'json'
  post '/api/delete/permissions/:id' ,to: 'permissions#delete', format: 'json'
  resources :permissions


  # 头像 相关接口 portraits
  # 显示 ‘所有 头像’
  get '/api/portraits', to: 'portraits#index', format: 'json'

  # 显示 ‘某个 头像’
  get '/api/portraits/:id', to: 'portraits#show', format: 'json'

  # 添加 ‘某个 头像’
  post '/api/portraits', to: 'portraits#create', format: 'json'

  # 更新 ‘某个 头像’
  put '/api/portraits/:id' ,to: 'portraits#update', format: 'json'
  post '/api/update/portraits/:id' ,to: 'portraits#update', format: 'json'

  # 删除 ‘某个 头像’
  delete '/api/portraits/:id' ,to: 'portraits#delete', format: 'json'
  post '/api/delete/portraits/:id' ,to: 'portraits#delete', format: 'json'
  resources :portraits


  # 价格规则 相关接口 price_rules
  # 显示 ‘所有 价格规则’
  get '/api/price_rules', to: 'price_rules#index', format: 'json'

  # 显示 ‘某个 价格规则’
  get '/api/price_rules/:id', to: 'price_rules#show', format: 'json'

  # 显示 ‘某个商品’ 的 ‘某个 价格规则’
  get '/api/products/:product_id/price_rules', to: 'price_rules#pricerulesbyproduct', format: 'json'

  # 添加 ‘某个 价格规则’
  post '/api/price_rules', to: 'price_rules#create', format: 'json'

  # 更新 ‘某个 价格规则’
  put '/api/price_rules/:id' ,to: 'price_rules#update', format: 'json'
  post '/api/update/price_rules/:id' ,to: 'price_rules#update', format: 'json'

  # 删除 ‘某个 价格规则’
  delete '/api/price_rules/:id' ,to: 'price_rules#delete', format: 'json'
  post '/api/delete/price_rules/:id' ,to: 'price_rules#delete', format: 'json'
  resources :price_rules


  # 价格类型 相关接口 price_types
  # 显示 ‘所有 价格类型’
  get '/api/price_types', to: 'price_types#index', format: 'json'

  # 显示 ‘某个 价格类型’
  get '/api/price_types/:id', to: 'price_types#show', format: 'json'

  # 添加 ‘某个 价格类型’
  post '/api/price_types', to: 'price_types#create', format: 'json'

  # 更新 ‘某个 价格类型’
  put '/api/price_types/:id' ,to: 'price_types#update', format: 'json'
  post '/api/update/price_types/:id' ,to: 'price_types#update', format: 'json'

  # 删除 ‘某个 价格类型’
  delete '/api/price_types/:id' ,to: 'price_types#delete', format: 'json'
  post '/api/delete/price_types/:id' ,to: 'price_types#delete', format: 'json'
  resources :price_types


  # 产品－品类 相关接口 product_categories
  # 显示 ‘所有 产品－品类’
  get '/api/product_categories', to: 'product_categories#index', format: 'json'

  # 显示 ‘某个 产品－品类’
  get '/api/product_categories/:id', to: 'product_categories#show', format: 'json'

  # 显示 ’某个 品类' 的 '产品－品类’
  get '/api/categories/:category_id/product_categories', to: 'product_categories#productsbycategory', format: 'json'

  # 添加 ‘某个 产品－品类’
  post '/api/product_categories', to: 'product_categories#create', format: 'json'

  # 更新 ‘某个 产品－品类’
  put '/api/product_categories/:id' ,to: 'product_categories#update', format: 'json'
  post '/api/update/product_categories/:id' ,to: 'product_categories#update', format: 'json'

  # 删除 ‘某个 产品－品类’
  delete '/api/product_categories/:id' ,to: 'product_categories#delete', format: 'json'
  post '/api/delete/product_categories/:id' ,to: 'product_categories#delete', format: 'json'
  resources :product_categories


  # 产品－城市 相关接口 products_cities 城市－》品类－》产品
  # 显示 ‘所有 产品－城市’
  get '/api/products_cities', to: 'products_cities#index', format: 'json'

  # 显示 ‘某个 产品－城市’
  get '/api/products_cities/:id', to: 'products_cities#show', format: 'json'

  # 显示 ’某个 城市' 的 ‘某个品类’ 的 '产品－城市’
  get '/api/cities/:city_id/categories/:category_id/products_cities', to: 'products_cities#productsbycityandcategory', format: 'json'

  # 添加 ‘某个 产品－城市’
  post '/api/products_cities', to: 'products_cities#create', format: 'json'

  # 更新 ‘某个 产品－城市’
  put '/api/products_cities/:id' ,to: 'products_cities#update', format: 'json'
  post '/api/update/products_cities/:id' ,to: 'products_cities#update', format: 'json'

  # 删除 ‘某个 产品－城市’
  delete '/api/products_cities/:id' ,to: 'products_cities#delete', format: 'json'
  post '/api/delete/products_cities/:id' ,to: 'products_cities#delete', format: 'json'
  resources :products_cities


  # 产品 相关接口 product
  # 显示 ‘所有产品’
  get '/api/products', to: 'products#index', format: 'json'

  # 显示 ‘某个产品’
  get '/api/products/:id', to: 'products#show', format: 'json'

  # 添加 ‘某个产品’
  post '/api/products', to: 'products#create', format: 'json'

  # 更新 ‘某个产品’
  put '/api/products/:id' ,to: 'products#update', format: 'json'
  post '/api/update/products/:id' ,to: 'products#update', format: 'json'

  # 删除 ‘某个产品’
  delete '/api/products/:id' ,to: 'products#destroy', format: 'json'
  post '/api/delete/products/:id' ,to: 'products#destroy', format: 'json'
  resources :products


  # 订单评价内容 相关接口 rank_comment
  # 显示 ‘所有评价内容’
  get '/api/rank_comments', to: 'rank_comments#index', format: 'json'

  # 显示 ‘某个评价内容’
  get '/api/rank_comments/:id', to: 'rank_comments#show', format: 'json'

  # 添加 ‘某个订单评价内容’
  post '/api/rank_comments', to: 'rank_comments#create', format: 'json'

  # 更新 ‘某个订单评价内容’
  put '/api/rank_comments/:id' ,to: 'rank_comments#update', format: 'json'
  post '/api/update/rank_comments/:id' ,to: 'rank_comments#update', format: 'json'

  # 删除 ‘某个订单评价内容’
  delete '/api/rank_comments/:id' ,to: 'rank_comments#destroy', format: 'json'
  post '/api/delete/rank_comments/:id' ,to: 'rank_comments#destroy', format: 'json'
  resources :rank_comments


  # 区域 相关接口 region
  # 显示 ‘所有区域’
  get '/api/regions', to: 'regions#index', format: 'json'

  # 显示 ‘某个区域’
  get '/api/regions/:id', to: 'regions#show', format: 'json'

  # 添加 ‘某个区域’
  post '/api/regions', to: 'regions#create', format: 'json'

  # 更新 ‘某个区域’
  put '/api/regions/:id' ,to: 'regions#update', format: 'json'
  post '/api/update/regions/:id' ,to: 'regions#update', format: 'json'

  # 删除 ‘某个区域’
  delete '/api/regions/:id' ,to: 'regions#delete', format: 'json'
  post '/api/delete/regions/:id' ,to: 'regions#delete', format: 'json'
  resources :regions


  # 驿站－城市 相关接口 station_cities
  # 显示 ‘所有 驿站－城市’
  get '/api/station_cities', to: 'station_cities#index', format: 'json'

  # 显示 ‘某个 驿站－城市
  get '/api/station_cities/:id', to: 'station_cities#show', format: 'json'

  # 显示 ‘某个城市' 的 '驿站－城市’
  get '/api/cities/:city_id/station_cities', to: 'station_cities#stationsbycity', format: 'json'

  # 添加 ‘某个 驿站－城市
  post '/api/station_cities', to: 'station_cities#create', format: 'json'

  # 更新 ‘某个 驿站－城市
  put '/api/station_cities/:id' ,to: 'station_cities#update', format: 'json'
  post '/api/update/station_cities/:id' ,to: 'station_cities#update', format: 'json'

  # 删除 ‘某个 驿站－城市
  delete '/api/station_cities/:id' ,to: 'station_cities#delete', format: 'json'
  post '/api/delete/station_cities/:id' ,to: 'station_cities#delete', format: 'json'
  resources :station_cities


  # 驿站－工厂’ 相关接口 station_factories
  # 显示 ‘所有 驿站－工厂’
  get '/api/station_factories', to: 'station_factories#index', format: 'json'

  # 显示 ‘某个 驿站－工厂’
  get '/api/station_factories/:id', to: 'station_factories#show', format: 'json'

  # 显示 ’某个 工厂' 的 '驿站－工厂’
  get '/api/factories/:factory_id/station_factories', to: 'station_factories#stationsbyfactory', format: 'json'

  # 添加 ‘某个 驿站－工厂’
  post '/api/station_factories', to: 'station_factories#create', format: 'json'

  # 更新 ‘某个 驿站－工厂’
  put '/api/station_factories/:id' ,to: 'station_factories#update', format: 'json'
  post '/api/update/station_factories/:id' ,to: 'station_factories#update', format: 'json'

  # 删除 ‘某个 驿站－工厂’
  delete '/api/station_factories/:id' ,to: 'station_factories#delete', format: 'json'
  post '/api/delete/station_factories/:id' ,to: 'station_factories#delete', format: 'json'
  resources :station_factories


  # 驿站 相关接口 station
  # 显示 ‘所有驿站’
  get '/api/stations', to: 'stations#index', format: 'json'

  # 显示 ‘某个驿站’
  get '/api/stations/:id', to: 'stations#show', format: 'json'

  # 添加 ‘某个驿站’
  post '/api/stations', to: 'stations#create', format: 'json'

  # 更新 ‘某个驿站’
  put '/api/stations/:id' ,to: 'stations#update', format: 'json'
  post '/api/stations/stations/:id' ,to: 'stations#update', format: 'json'

  # 删除 ‘某个驿站’
  delete '/api/stations/:id' ,to: 'stations#delete', format: 'json'
  post '/api/delete/stations/:id' ,to: 'stations#delete', format: 'json'
  resources :stations


  # 账号状态 相关接口 statuses
  # 显示 ‘所有 账号状态‘
  get '/api/statuses', to: 'statuses#index', format: 'json'

  # 显示 ‘某个 账号状态‘
  get '/api/statuses/:id', to: 'statuses#show', format: 'json'

  # 添加 ‘某个 账号状态‘
  post '/api/statuses', to: 'statuses#create', format: 'json'

  # 更新 ‘某个 账号状态‘
  put '/api/statuses/:id' ,to: 'statuses#update', format: 'json'
  post '/api/update/statuses/:id' ,to: 'statuses#update', format: 'json'

  # 删除 ‘某个 账号状态‘
  delete '/api/statuses/:id' ,to: 'statuses#delete', format: 'json'
  post '/api/delete/statuses/:id' ,to: 'statuses#delete', format: 'json'
  resources :statuses


  # 用户地址 相关接口 user_address
  # 显示 ‘所有地址’
  get '/api/user_addresses', to: 'user_addresses#index', format: 'json'

  # 显示 ‘某个地址’
  get '/api/user_addresses/:id', to: 'user_addresses#show', format: 'json'

  # 显示 ‘某个用户’ 的 ‘所有地址’
  get '/api/users/:user_id/user_addresses', to: 'user_addresses#addressesbyuser', format: 'json'

  # 显示 ‘某个用户’ 的 ‘默认地址’
  get '/api/users/:user_id/user_addresses', to: 'user_addresses#defaultaddressbyuser', format: 'json'

  # 添加 ‘某个用户地址’ 
  post '/api/user_addresses', to:'user_addresses#create', format:'json'

  # 更新 ‘某个用户地址’
  put '/api/user_addresses/:id' ,to: 'user_addresses#update', format: 'json'
  post '/api/update/user_addresses/:id' ,to: 'user_addresses#update', format: 'json' 

  # 删除 ‘某个用户地址’
  delete '/api/user_addresses/:id' ,to: 'user_addresses#destroy', format: 'json'
  post '/api/delete/user_addresses/:id' ,to: 'user_addresses#destroy', format: 'json'
  resources :user_addresses


  # 用户－城市 相关接口 user_cities
  # 显示 ‘所有 用户－城市’
  get '/api/user_cities', to: 'user_cities#index', format: 'json'

  # 显示 ‘某个 用户－城市‘
  get '/api/user_cities/:id', to: 'user_cities#show', format: 'json'

  # 显示 ’某个城市' 的 '用户－城市’
  get '/api/cities/:city_id/user_cities', to: 'user_cities#usersbycity', format: 'json'

  # 添加 ‘某个 用户－城市‘
  post '/api/user_cities', to: 'user_cities#create', format: 'json'

  # 更新 ‘某个 用户－城市’
  put '/api/user_cities/:id' ,to: 'user_cities#update', format: 'json'
  post '/api/update/user_cities/:id' ,to: 'user_cities#update', format: 'json'

  # 删除 ‘某个 用户－城市‘
  delete '/api/user_cities/:id' ,to: 'user_cities#delete', format: 'json'
  post '/api/delete/user_cities/:id' ,to: 'user_cities#delete', format: 'json'
  resources :user_cities


  # 用户－头像 相关接口 user_portraits
  # 显示 ‘所有 用户－头像’
  get '/api/user_portraits', to: 'user_portraits#index', format: 'json'

  # 显示 ‘某个 用户－头像’
  get '/api/user_portraits/:id', to: 'user_portraits#show', format: 'json'

  # 显示 ‘某个用户' 的 '用户－头像’
  get '/api/users/:user_id/portrait', to: 'user_portraits#portraitbyuser', format: 'json'

  # 添加 ‘某个 用户－头像’
  post '/api/user_portraits', to: 'user_portraits#create', format: 'json'

  # 更新 ‘某个 用户－头像’
  put '/api/user_portraits/:id' ,to: 'user_portraits#update', format: 'json'
  post '/api/update/user_portraits/:id' ,to: 'user_portraits#update', format: 'json'

  # 删除 ‘某个 用户－头像’
  delete '/api/user_portraits/:id' ,to: 'user_portraits#delete', format: 'json'
  post '/api/delete/user_portraits/:id' ,to: 'user_portraits#delete', format: 'json'
  resources :user_portraits


  # 用户 相关接口 user
  # 显示 ‘所有用户’
  get '/api/users', to: 'users#index', format: 'json'

  # 显示 ‘某个用户’
  get '/api/users/:id', to: 'users#show', format: 'json'

  # 添加 ‘某个用户’ 
  post '/api/users', to:'users#create', format:'json'

  # 更新 ‘某个用户’
  put '/api/users/:id' ,to: 'users#update', format: 'json'
  post '/api/update/users/:id' ,to: 'users#update', format: 'json'

  # 删除 ‘某个用户’
  delete '/api/users/:id' ,to: 'users#destroy', format: 'json'
  post '/api/delete/users/:id' ,to: 'users#destroy', format: 'json'
  resources :users

end
