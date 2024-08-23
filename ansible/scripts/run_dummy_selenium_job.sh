PATH="$PATH:/usr/local/bin"
ansible-playbook --connection=local --inventory 127.0.0.1, --extra-vars "workspace=${WORKSPACE}" ./ansible/playbooks/pb_run_dummy_selenium_job.yaml
```

- Run the following command to test the `dummy_selenium_test_headless.py` file.