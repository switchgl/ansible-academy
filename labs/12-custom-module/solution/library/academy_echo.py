#!/usr/bin/python
from ansible.module_utils.basic import AnsibleModule

def main():
    module = AnsibleModule(
        argument_spec=dict(
            message=dict(type='str', required=True)
        )
    )
    module.exit_json(changed=False, echoed=module.params['message'])

if __name__ == '__main__':
    main()
