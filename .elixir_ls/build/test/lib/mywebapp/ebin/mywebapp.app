{application,mywebapp,
             [{applications,[kernel,stdlib,elixir,logger,cowboy,plug,poison,
                             env_helper,remix]},
              {description,"mywebapp"},
              {modules,['Elixir.Hondacars','Elixir.Mywebapp.Application',
                        'Elixir.Parser','Elixir.Settings',
                        'Elixir.SimpleServer.Router']},
              {registered,[]},
              {vsn,"0.1.0"},
              {extra_applications,[logger,cowboy,plug,poison]},
              {mod,{'Elixir.Mywebapp.Application',[]}}]}.
