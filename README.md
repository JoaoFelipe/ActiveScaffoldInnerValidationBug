# What is this project?

This project was created to make it easy and provide steps to reproduce the Issue:
https://github.com/activescaffold/active_scaffold/issues/671

```
NoMethodError (undefined method `to_sym' for #<ActiveModel::Error:0x000056357bfddf98>
Did you mean?  to_s):
```

## Steps to reproduce the Issue

1. Open `/main_models` (MainModel link)
2. Click in `Create New`
3. Fill `Title` and check `Fail`
4. Click in `Create`

## Workaround

```
ActiveModel::Error.class_eval do
  def to_sym
    self.to_s.to_sym
  end
end
```

## Full stack trace

```
  Started POST "/main_models" for 127.0.0.1 at 2021-09-13 13:25:18 -0300
  Processing by MainModelsController#create as JS
    Parameters: {"record"=>{"title"=>"", "child_models"=>{"0"=>"", "1631550316219"=>{"fail"=>"1"}}}, "commit"=>"Create"}
  Completed 500 Internal Server Error in 4ms (ActiveRecord: 0.0ms | Allocations: 3278)
  
  
  
  NoMethodError (undefined method `to_sym' for #<ActiveModel::Error:0x000056357bfddf98>
  Did you mean?  to_s):
  
  activemodel (6.1.4.1) lib/active_model/errors.rb:573:in `normalize_arguments'
  activemodel (6.1.4.1) lib/active_model/errors.rb:168:in `where'
  activemodel (6.1.4.1) lib/active_model/errors.rb:507:in `messages_for'
  activemodel (6.1.4.1) lib/active_model/errors.rb:208:in `[]'
  active_scaffold (3.6.1) lib/active_scaffold/extensions/unsaved_record.rb:22:in `block in keeping_errors'
  activemodel (6.1.4.1) lib/active_model/errors.rb:237:in `each'
  activemodel (6.1.4.1) lib/active_model/errors.rb:237:in `each'
  active_scaffold (3.6.1) lib/active_scaffold/extensions/unsaved_record.rb:21:in `keeping_errors'
  active_scaffold (3.6.1) lib/active_scaffold/extensions/unsaved_associated.rb:8:in `block in associated_valid?'
  active_scaffold (3.6.1) lib/active_scaffold/extensions/unsaved_associated.rb:57:in `block (2 levels) in with_unsaved_associated'
  active_scaffold (3.6.1) lib/active_scaffold/extensions/unsaved_associated.rb:57:in `map'
  active_scaffold (3.6.1) lib/active_scaffold/extensions/unsaved_associated.rb:57:in `block in with_unsaved_associated'
  active_scaffold (3.6.1) lib/active_scaffold/extensions/unsaved_associated.rb:51:in `map'
  active_scaffold (3.6.1) lib/active_scaffold/extensions/unsaved_associated.rb:51:in `with_unsaved_associated'
  active_scaffold (3.6.1) lib/active_scaffold/extensions/unsaved_associated.rb:8:in `associated_valid?'
  active_scaffold (3.6.1) lib/active_scaffold/actions/create.rb:101:in `block in do_create'
  activerecord (6.1.4.1) lib/active_record/connection_adapters/abstract/database_statements.rb:320:in `block in transaction'
  activerecord (6.1.4.1) lib/active_record/connection_adapters/abstract/transaction.rb:319:in `block in within_new_transaction'
  activesupport (6.1.4.1) lib/active_support/concurrency/load_interlock_aware_monitor.rb:26:in `block (2 levels) in synchronize'
  activesupport (6.1.4.1) lib/active_support/concurrency/load_interlock_aware_monitor.rb:25:in `handle_interrupt'
  activesupport (6.1.4.1) lib/active_support/concurrency/load_interlock_aware_monitor.rb:25:in `block in synchronize'
  activesupport (6.1.4.1) lib/active_support/concurrency/load_interlock_aware_monitor.rb:21:in `handle_interrupt'
  activesupport (6.1.4.1) lib/active_support/concurrency/load_interlock_aware_monitor.rb:21:in `synchronize'
  activerecord (6.1.4.1) lib/active_record/connection_adapters/abstract/transaction.rb:317:in `within_new_transaction'
  activerecord (6.1.4.1) lib/active_record/connection_adapters/abstract/database_statements.rb:320:in `transaction'
  activerecord (6.1.4.1) lib/active_record/transactions.rb:209:in `transaction'
  active_scaffold (3.6.1) lib/active_scaffold/actions/create.rb:95:in `do_create'
  active_scaffold (3.6.1) lib/active_scaffold/actions/create.rb:13:in `create'
  actionpack (6.1.4.1) lib/action_controller/metal/basic_implicit_render.rb:6:in `send_action'
  actionpack (6.1.4.1) lib/abstract_controller/base.rb:228:in `process_action'
  actionpack (6.1.4.1) lib/action_controller/metal/rendering.rb:30:in `process_action'
  actionpack (6.1.4.1) lib/abstract_controller/callbacks.rb:42:in `block in process_action'
  activesupport (6.1.4.1) lib/active_support/callbacks.rb:117:in `block in run_callbacks'
  active_scaffold (3.6.1) lib/active_scaffold/actions/core.rb:311:in `clear_storage'
  activesupport (6.1.4.1) lib/active_support/callbacks.rb:126:in `block in run_callbacks'
  actiontext (6.1.4.1) lib/action_text/rendering.rb:20:in `with_renderer'
  actiontext (6.1.4.1) lib/action_text/engine.rb:59:in `block (4 levels) in <class:Engine>'
  activesupport (6.1.4.1) lib/active_support/callbacks.rb:126:in `instance_exec'
  activesupport (6.1.4.1) lib/active_support/callbacks.rb:126:in `block in run_callbacks'
  activesupport (6.1.4.1) lib/active_support/callbacks.rb:137:in `run_callbacks'
  actionpack (6.1.4.1) lib/abstract_controller/callbacks.rb:41:in `process_action'
  actionpack (6.1.4.1) lib/action_controller/metal/rescue.rb:22:in `process_action'
  actionpack (6.1.4.1) lib/action_controller/metal/instrumentation.rb:34:in `block in process_action'
  activesupport (6.1.4.1) lib/active_support/notifications.rb:203:in `block in instrument'
  activesupport (6.1.4.1) lib/active_support/notifications/instrumenter.rb:24:in `instrument'
  activesupport (6.1.4.1) lib/active_support/notifications.rb:203:in `instrument'
  actionpack (6.1.4.1) lib/action_controller/metal/instrumentation.rb:33:in `process_action'
  actionpack (6.1.4.1) lib/action_controller/metal/params_wrapper.rb:249:in `process_action'
  activerecord (6.1.4.1) lib/active_record/railties/controller_runtime.rb:27:in `process_action'
  actionpack (6.1.4.1) lib/abstract_controller/base.rb:165:in `process'
  actionview (6.1.4.1) lib/action_view/rendering.rb:39:in `process'
  actionpack (6.1.4.1) lib/action_controller/metal.rb:190:in `dispatch'
  actionpack (6.1.4.1) lib/action_controller/metal.rb:254:in `dispatch'
  actionpack (6.1.4.1) lib/action_dispatch/routing/route_set.rb:50:in `dispatch'
  actionpack (6.1.4.1) lib/action_dispatch/routing/route_set.rb:33:in `serve'
  actionpack (6.1.4.1) lib/action_dispatch/journey/router.rb:50:in `block in serve'
  actionpack (6.1.4.1) lib/action_dispatch/journey/router.rb:32:in `each'
  actionpack (6.1.4.1) lib/action_dispatch/journey/router.rb:32:in `serve'
  actionpack (6.1.4.1) lib/action_dispatch/routing/route_set.rb:842:in `call'
  rack (2.2.3) lib/rack/tempfile_reaper.rb:15:in `call'
  rack (2.2.3) lib/rack/etag.rb:27:in `call'
  rack (2.2.3) lib/rack/conditional_get.rb:40:in `call'
  rack (2.2.3) lib/rack/head.rb:12:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/http/permissions_policy.rb:22:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/http/content_security_policy.rb:18:in `call'
  rack (2.2.3) lib/rack/session/abstract/id.rb:266:in `context'
  rack (2.2.3) lib/rack/session/abstract/id.rb:260:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/middleware/cookies.rb:689:in `call'
  activerecord (6.1.4.1) lib/active_record/migration.rb:601:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/middleware/callbacks.rb:27:in `block in call'
  activesupport (6.1.4.1) lib/active_support/callbacks.rb:98:in `run_callbacks'
  actionpack (6.1.4.1) lib/action_dispatch/middleware/callbacks.rb:26:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/middleware/executor.rb:14:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/middleware/actionable_exceptions.rb:18:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/middleware/debug_exceptions.rb:29:in `call'
  web-console (4.1.0) lib/web_console/middleware.rb:132:in `call_app'
  web-console (4.1.0) lib/web_console/middleware.rb:28:in `block in call'
  web-console (4.1.0) lib/web_console/middleware.rb:17:in `catch'
  web-console (4.1.0) lib/web_console/middleware.rb:17:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/middleware/show_exceptions.rb:33:in `call'
  railties (6.1.4.1) lib/rails/rack/logger.rb:37:in `call_app'
  railties (6.1.4.1) lib/rails/rack/logger.rb:26:in `block in call'
  activesupport (6.1.4.1) lib/active_support/tagged_logging.rb:99:in `block in tagged'
  activesupport (6.1.4.1) lib/active_support/tagged_logging.rb:37:in `tagged'
  activesupport (6.1.4.1) lib/active_support/tagged_logging.rb:99:in `tagged'
  railties (6.1.4.1) lib/rails/rack/logger.rb:26:in `call'
  sprockets-rails (3.2.2) lib/sprockets/rails/quiet_assets.rb:13:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/middleware/remote_ip.rb:81:in `call'
  request_store (1.5.0) lib/request_store/middleware.rb:19:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/middleware/request_id.rb:26:in `call'
  rack (2.2.3) lib/rack/method_override.rb:24:in `call'
  rack (2.2.3) lib/rack/runtime.rb:22:in `call'
  activesupport (6.1.4.1) lib/active_support/cache/strategy/local_cache_middleware.rb:29:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/middleware/executor.rb:14:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/middleware/static.rb:24:in `call'
  rack (2.2.3) lib/rack/sendfile.rb:110:in `call'
  actionpack (6.1.4.1) lib/action_dispatch/middleware/host_authorization.rb:98:in `call'
  rack-mini-profiler (2.3.3) lib/mini_profiler/profiler.rb:393:in `call'
  railties (6.1.4.1) lib/rails/engine.rb:539:in `call'
  puma (5.4.0) lib/puma/configuration.rb:249:in `call'
  puma (5.4.0) lib/puma/request.rb:77:in `block in handle_request'
  puma (5.4.0) lib/puma/thread_pool.rb:340:in `with_force_shutdown'
  puma (5.4.0) lib/puma/request.rb:76:in `handle_request'
  puma (5.4.0) lib/puma/server.rb:440:in `process_client'
  puma (5.4.0) lib/puma/thread_pool.rb:147:in `block in spawn_thread'
```
