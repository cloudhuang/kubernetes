Istio
=============

## 下载并配置Istio

`export ALL_PROXY=socks5://192.168.0.80:10808`  下载istio的时候先要使用代理，否则下载不了(GFW)。

```
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.6.5
export PATH=$PWD/bin:$PATH
istioctl version --short
1.6.5
```

## 流量管理

### 规则配置

#### VirtualService
VirtualService的主要功能是定义路由规则，使请求（流量）可以依据这些规则被分发到对应的服务。

#### DestinationRule
DestinationRule通常都是和VirtualService成对出现的。它的功能是当VirtualService的路由生效后，配置一些策略并应用到请求中。

#### ServiceEntry
用来给服务网格内的服务提供访问外部URL的能力。Istio中的服务发现功能主要是依靠服务注册表实现的，ServiceEntry能够在注册表中添加外部服务，使得内部服务可以访问这些被添加的URL。因此，通过ServiceEntry就可以实现访问外部服务的能力。【Engress】

#### Gateway
和ServiceEntry相反，外部请求想要访问网格内的服务就要用到Gateway。Gateway为进入网格的请求配置了一个负载均衡器，把VirtualService绑定到Gateway，这样就可以设置规则来控制进入的流量。【Ingress】

### 流量转移

#### 蓝绿部署

#### 金丝雀发布

#### AB测试



## 安装Istio

```
istioctl manifest apply --set-profile demo
```

or 

```
istioctl manifest genearte > ./generated-manifest.yaml
kubectl apply -f ./generated-manifest.yaml
```

