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
  post '/api/factories/login', to:'factories#login', format:'json'#参数：telphone，password
  # 加工商 注册 接口
  post '/api/factories', to:'factories#create', format:'json'#参数：username, telphone, password

  # 运营人员 登录 接口
  post '/api/operators/login', to:'operators#login', format:'json'#参数：telphone，password
  # 运营人员 注册 接口
  post '/api/operators', to:'operators#create', format:'json'#参数：username, telphone, password


  # 产品 相关接口 product
  # 显示 ‘所有产品’
  get '/api/products', to: 'products#index', format: 'json'
  # 显示 ‘某个产品’
  get '/api/products/:id', to: 'products#show', format: 'json'
  # 显示 ‘某个品类’ 的 ‘所有产品’
  get '/api/categories/:category_id/products', to:'products#productsbycategory', format: 'json'
  # 显示 ‘某个品类’ 的 ‘某个产品’
  get '/api/categories/:category_id/products/:id', to:'products#productbycategoryandid', format: 'json'
  # 显示 ‘某个状态’ 的 ‘所有产品’
  get '/api/statuses/:status/products', to:'products#productsbystatus', format: 'json'
  # 显示 ‘某个状态’ 的 ‘某个产品’
  get '/api/statuses/:status/products/:id', to:'products#productbystatusandid', format: 'json'
  # 添加 ‘某个产品’
  post '/api/products', to: 'products#create', format: 'json'
  # 更新 ‘某个产品’
  put '/api/products/:id' ,to: 'products#update', format: 'json'
  post '/api/update/products/:id' ,to: 'products#update', format: 'json'
  # 删除 ‘某个产品’
  delete '/api/products/:id' ,to: 'products#delete', format: 'json'
  post '/api/delete/products/:id' ,to: 'products#delete', format: 'json'


  # 品类 相关接口 category
  # 显示 ‘所有品类’
  get '/api/categories', to: 'categories#index', format: 'json'
  # 显示 ‘某个品类’
  get '/api/categories/:id', to: 'categories#show', format: 'json'
  # 显示 ‘某个状态’ 的 ‘所有产品’
  get '/api/statuses/:status/categories', to:'categories#categoriesbystatus', format: 'json'
  # 显示 ‘某个状态’ 的 ‘某个产品’
  get '/api/statuses/:status/categories/:id', to:'categories#categorybystatusandid', format: 'json'
  # 添加 ‘某个品类’
  post '/api/categories', to: 'categories#create', format: 'json'
  # 更新 ‘某个品类’
  put '/api/categories/:id', to: 'categories#update', format: 'json'
  post '/api/update/categories/:id', to: 'categories#update', format: 'json'
  # 删除 ‘某个品类’
  delete '/api/categories/:id' ,to: 'categories#delete', format: 'json'
  post '/api/delete/categories/:id' ,to: 'categories#delete', format: 'json'


  # 订单 相关接口 order
  # 显示 ‘所有用户’ 的 ‘所有订单’
  get '/api/orders', to: 'orders#index', format: 'json' 
  # 显示 ‘某个订单’
  get 'api/orders/:id', to: 'orders#show', format: 'json'
  # 显示 ‘某个用户’ 下的 ‘所有订单’
  get '/api/users/:user_id/orders', to: 'orders#ordersbyuser' ,format: 'json'
  # 显示 ‘某种状态’ 下的 ‘所有订单’
  get '/api/statuses/:status/orders', to: 'orders#ordersbystatus' ,format: 'json'
  # 显示 ‘某个用户’的‘某种状态’ 的 ‘所有订单’
  get '/api/users/:user_id/statuses/:status/orders', to: 'orders#ordersbyuserandstatus', format: 'json'
  # 显示 ‘某个用户’的‘某个订单’
  get '/api/users/:user_id/orders/:id', to: 'orders#orderbyuserandid', format: 'json'
  # 添加 ‘某个订单’
  post '/api/orders', to: 'orders#create', format: 'json'
  # 更新 ‘某个订单’
  put '/api/orders/:id' ,to: 'orders#update', format: 'json'
  post '/api/update/orders/:id' ,to: 'orders#update', format: 'json'
  # 删除 ‘某个产品’
  delete '/api/orders/:id' ,to: 'orders#delete', format: 'json'
  post '/api/delete/orders/:id' ,to: 'orders#delete', format: 'json'


  # 订单项 相关接口 order_item
  # 显示 ‘所有订单项’
  get '/api/order_items', to: 'order_items#index', format: 'json'
  # 显示 ‘某个订单项’
  get '/api/order_items/:id', to: 'order_items#show', format: 'json'
  # 添加 ‘某个订单项’
  post '/api/order_items', to: 'order_items#create', format: 'json'
  # 更新 ‘某个订单项’
  put '/api/order_items/:id' ,to: 'order_items#update', format: 'json'
  post '/api/update/order_items/:id' ,to: 'order_items#update', format: 'json'
  # 删除 ‘某个产品’
  delete '/api/order_items/:id' ,to: 'order_items#delete', format: 'json'
  post '/api/delete/order_items/:id' ,to: 'order_items#delete', format: 'json'


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
  delete '/api/rank_comments/:id' ,to: 'rank_comments#delete', format: 'json'
  post '/api/delete/rank_comments/:id' ,to: 'rank_comments#delete', format: 'json'


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
  delete '/api/users/:id' ,to: 'users#delete', format: 'json'
  post '/api/delete/users/:id' ,to: 'users#delete', format: 'json'


  # 用户地址 相关接口 user_address
  # 显示 ‘所有地址’
  get '/api/user_addresses', to: 'user_addresses#index', format: 'json'
  # 显示 ‘某个地址’
  get '/api/user_addresses/:id', to: 'user_addresses#show', format: 'json'
  # 显示 ‘某个用户’ 的 ‘所有地址’
  get '/api/users/:user_id/user_addresses', to: 'user_addresses#user_addressesbyuser', format: 'json'
  # 显示 ‘某个用户’ 的 ‘某个地址’
  get '/api/users/:user_id/user_addresses/:id', to: 'user_addresses#user_addressbyuserandid', format: 'json'
  # 添加 ‘某个用户地址’ 
  post '/api/user_addresses', to:'user_addresses#create', format:'json'
  # 更新 ‘某个用户地址’
  put '/api/user_addresses/:id' ,to: 'user_addresses#update', format: 'json'
  post '/api/update/user_addresses/:id' ,to: 'user_addresses#update', format: 'json' 
  # 删除 ‘某个用户地址’
  delete '/api/user_addresses/:id' ,to: 'user_addresses#delete', format: 'json'
  post '/api/delete/user_addresses/:id' ,to: 'user_addresses#delete', format: 'json'


  # 优惠券 相关借口 coupon
  # 显示 ‘所有优惠券’
  get '/api/coupons', to: 'coupons#index', format: 'json'
  # 显示 ‘某个优惠券’
  get '/api/coupons/:id', to: 'coupons#show', format: 'json'
  # 显示 ‘某个用户’ 的 ‘所有优惠券’
  get '/api/users/:user_id/coupons', to: 'coupons#couponsbyuser', format: 'json'
  # 显示 ‘某个用户’ 的 ‘某个优惠券’
  get '/api/users/:user_id/coupons/:id', to: 'coupons#couponbyuserandid', format: 'json'
  # 显示 '某个类型' 的 ‘所有优惠券’
  get '/api/coupon_type/:coupon_type/coupons', to: 'coupons#couponsbytype', format: 'json'
  # 显示 ‘某个类型’ 的 ‘某个优惠券’
  get '/api/coupon_type/:coupon_type/coupons/:id', to: 'coupons#couponbytypeandid', format: 'json'
  # 添加 ‘某个优惠券’
  post '/api/coupons', to: 'coupons#create', format: 'json'
  # 更新 ‘某个优惠券’
  put '/api/coupons/:id' ,to: 'coupons#update', format: 'json'
  post '/api/update/coupons/:id' ,to: 'coupons#update', format: 'json'
  # 删除 ‘某个优惠券’
  delete '/api/coupons/:id' ,to: 'coupons#delete', format: 'json'
  post '/api/delete/coupons/:id' ,to: 'coupons#delete', format: 'json'


  # 取送员 相关接口 courier
  # 显示 ‘所有取送员’
  get '/api/couriers', to: 'couriers#index', format: 'json'
  # 显示 ‘某个取送员’
  get '/api/couriers/:id', to: 'couriers#show', format: 'json'
  # 显示 ‘某个状态’ 的 ‘所有取送员’
  get '/api/statuses/:status/couriers', to: 'couriers#couriersbystatus', format: 'json'
  # 添加 ‘某个取送员’
  post '/api/couriers', to: 'couriers#create', format: 'json'
  # 更新 ‘某个取送员’
  put '/api/couriers/:id' ,to: 'couriers#update', format: 'json'
  post '/api/update/couriers/:id' ,to: 'couriers#update', format: 'json'
  # 删除 ‘某个取送员’
  delete '/api/couriers/:id' ,to: 'couriers#delete', format: 'json'
  post '/api/delete/couriers/:id' ,to: 'couriers#delete', format: 'json'


  # 工厂 相关接口 factory
  # 显示 ’所有工厂‘
  get '/api/factories', to: 'factories#index', format: 'json'
  # 显示 ’某个工厂‘
  get '/api/factories/:id', to: 'factories#show', format: 'json'
  # 添加 ‘某个工厂’
  post '/api/factories', to: 'factories#create', format: 'json'
  # 更新 ‘某个工厂’
  put '/api/factories/:id' ,to: 'factories#update', format: 'json'
  post '/api/update/factories/:id' ,to: 'factories#update', format: 'json'
  # 删除 ‘某个工厂’
  delete '/api/factories/:id' ,to: 'factories#delete', format: 'json'
  post '/api/delete/factories/:id' ,to: 'factories#delete', format: 'json'


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


  get '/login', to:'users#new'



  resources :categories
  resources :operators
  resources :products
  resources :rank_comments
  resources :order_items
  resources :orders
  resources :coupons
  resources :user_addresses
  resources :factories
  resources :couriers
  resources :users
  resources :regions
  resources :cities
  resources :stations
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
