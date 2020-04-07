我们需要修改一下calico.yaml解决node节点calico通信失败问题

           - name: CLUSTER_TYPE
              value: "k8s,bgp"
            - name: IP_AUTODETECTION_METHOD
              value: "interface=ens.*"
              #或者 value: "interface=ens160"
            # Auto-detect the BGP IP address.
            - name: IP
              value: "autodetect"
            # Enable IPIP
            - name: CALICO_IPV4POOL_IPIP
              value: "Always"

