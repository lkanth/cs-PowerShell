namespace: PSActions
flow:
  name: psGetDate
  workflow:
    - PowerShell_Script:
        do_external:
          f0b2afd2-5733-47e4-80ba-7f2387cc66d5:
            - host: "${get_sp('psRemoteHost')}"
            - username: "${get_sp('psRemoteHostUser')}"
            - password:
                value: "${get_sp('psRemoteHostUserPwd')}"
                sensitive: true
            - useSSL: "${get_sp('psUseSSL')}"
            - skipCACheck: 'true'
            - skipCNCheck: 'true'
            - script: date
        publish:
          - currentDate: '${returnResult.strip()}'
        navigate:
          - success: SUCCESS
          - failure: on_failure
  outputs:
    - CurrentDate: '${currentDate}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      PowerShell_Script:
        x: 298.8923645019531
        'y': 241.25
        navigate:
          70b35450-b188-5e63-dbad-b5acfa36f953:
            targetId: 9f4ac978-2b49-8d10-b582-39c11a9c24a3
            port: success
    results:
      SUCCESS:
        9f4ac978-2b49-8d10-b582-39c11a9c24a3:
          x: 668.111083984375
          'y': 237.67013549804688
