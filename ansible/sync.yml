---
- hosts: origin
  tasks:

  - name: Synchronization of src on the inventory host to the dest on the localhost in pull mode
    synchronize:
      mode: pull
      src: /tmp/
      dest: /ansible/ssl
      recursive: yes
      delete: yes
    register: certificates
  
  - debug:
      msg: "{{ certificates }}"
  
- hosts: localhost
  tasks:
  - name: Find synced certs
    find:
      paths: /ansible/ssl
      file_type: file
      patterns: "*.pem"
      recurse: yes
      excludes: "localhost.crt"
    register: find_result

  - debug:
      msg: "{{ find_result }}"

  - name: Test whether that certificate is valid tomorrow and/or in three weeks
    openssl_certificate_info:
      path: "{{ item.path }}"
      valid_at:
        point_1: "+1d"
        point_2: "+5w"
    register: result
    loop: "{{ find_result.files }}"

  - debug:
      msg: "{{ result }}"
  
  - name: Validate that certificate is valid tomorrow, but not in three weeks
    assert:
      that:
        - item.valid_at.point_1      # valid in one day
        - item.valid_at.point_2  # not valid in three weeks
    loop: "{{ result.results }}"

      #  - name: Filter out valid certs
      #    set_fact:
      #      outdated_certs: "{{ result | json_query('results[? !(valid_at.point_1) || !(valid_at.point_2)]') }}"
      #
      #  - block:
      #      - name: Check that all certificates are valid
      #        assert:
      #          that:
      #            - outdated_certs | count == 0
      #
      #    rescue:
      #      - name: Show info about outdated certs
      #        debug:
      #          msg: >-
      #            {{ { "Outdated Certs": outdated_certs | json_query("[].item.path") } }}
      #
      #      - fail:
      #          msg: "Outdated certs found. See list above"



- hosts: destination
  tasks:
  - name: Synchronization of src on delegate host to dest on the current inventory host.
    synchronize:
      src: /ansible/ssl/
      dest: /etc/haproxy/ssl
      recursive: yes
      delete: yes
    delegate_to: localhost
    notify: 
    - reload_haproxy

  handlers:
  - name: reload_haproxy 
    service:
      name: haproxy
      state: reloaded
