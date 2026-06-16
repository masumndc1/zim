/*

func (r *ProtocolOCI) getProxyHost() (*url.URL, error) {
	req, err := http.NewRequest("GET", r.httpHost, nil)
	if err != nil {
		return nil, err
	}

	proxy, err := r.http.Transport.(*http.Transport).Proxy(req)
	if err != nil {
		return nil, err
	}

	return proxy, nil
}


Explanation: Go Proxy Host Resolution Code

This Go function extracts the configured HTTP proxy URL for a specific connection.
It dynamically determines which proxy server (if any) should handle network
requests destined for the target host (r.httpHost).

# Line-by-Line Analysis

func (r *ProtocolOCI) getProxyHost() (*url.URL, error)

func: The keyword used to declare a function or method.
(r *ProtocolOCI): the receiver, this function to a specific struct name ProtocolOCI
getProxyHost: The name of the method. Because the first letter is lowercase (g),
this method is unexported (private) and can only be called by other code inside the same Go package.
(): The parameter list. This function does not accept any inputs when you call it.
(*url.URL, error): The return types.
This function returns two separate values when it finishes executing:
a pointer to an initialized url.URL struct (which contains the proxy address)
and an error interface value (to signal if something went wrong).

 1. Creating a Fake Target Request
    req, err := http.NewRequest("GET", r.httpHost, nil)

    Why it does this:
    Go's proxy configuration system evaluated by http.Transport
    depends on the destination URL (for example, to see if the host matches
    exception variables like NO_PROXY).

    The code constructs a dummy http.Request aimed at your target address
    (r.httpHost) so the proxy engine has the exact context it needs to
    make a routing decision.

 2. The Type Assertion
    r.http.Transport.(*http.Transport)

    Why it does this: In Go's standard library, r.http.Transport is typically defined as a generic http.RoundTripper interface. Interfaces do not expose configuration properties directly. The code uses a type assertion .(*http.Transport) to explicitly convert the interface back into its concrete struct type, giving the code access to the underlying .Proxy function.

 3. Resolving the Proxy Address
    proxy, err := r.http.Transport.(*http.Transport).Proxy(req)

    This passes the fake request to the transport's proxy resolver function. The function checks global system settings, environment variables (like HTTP_PROXY), or custom code blocks to figure out where traffic should route.

    Returns: A pointer to a url.URL struct containing the proxy details (e.g., http://example.com), or nil if the traffic should bypass proxies and connect directly.

Structural Risk Factors & Solutions

  - The Panic Risk (Nil Interface Pointer):
    If r.http.Transport is ever assigned a custom or wrapped interface that is not exactly an *http.Transport struct, the type assertion will instantly panic and crash your entire application.

  - The Direct-Connection Case:
    If no proxy is configured for r.httpHost, the function successfully returns (nil, nil). The caller of getProxyHost() must explicitly handle a nil URL pointer without assuming an error occurred, otherwise it will trigger a nil pointer dereference panic downstream.

Production-Ready Refactored Code (Safe Version)
*/

package main

import (
	"fmt"
	"net/http"
	"net/url"
)

// ProtocolOCI manages network connections to OCI container registries.
type ProtocolOCI struct {
	httpHost string
	http     *http.Client
}

// getProxyHost evaluates the transport layer to find the routing proxy for the target host.
func (r *ProtocolOCI) getProxyHost() (*url.URL, error) {
	// 1. Create a dummy request to provide destination context for proxy rules (like NO_PROXY)
	req, err := http.NewRequest("GET", r.httpHost, nil)
	if err != nil {
		return nil, fmt.Errorf("failed to create dummy request: %w", err)
	}

	// 2. Safe Type Assertion: Verify the interface concrete type to prevent panics
	transport, ok := r.http.Transport.(*http.Transport)
	if !ok {
		return nil, fmt.Errorf("underlying network transport is not a standard *http.Transport")
	}

	// 3. Resolve the configured proxy endpoint
	proxy, err := transport.Proxy(req)
	if err != nil {
		return nil, fmt.Errorf("failed to resolve proxy configuration: %w", err)
	}

	return proxy, nil
}

func main() {
	// Create a client utilizing default machine environments (HTTP_PROXY / NO_PROXY)
	client := &http.Client{
		Transport: http.DefaultTransport,
	}

	// Initialize the protocol targeting an OCI registry
	ociClient := &ProtocolOCI{
		httpHost: "https://docker.io",
		http:     client,
	}

	// Execute proxy resolution
	proxyURL, err := ociClient.getProxyHost()
	if err != nil {
		fmt.Printf("Error checking proxy: %v\n", err)
		return
	}

	// Handle the output states safely
	if proxyURL == nil {
		fmt.Println("No proxy configured for this host. Traffic routes directly.")
	} else {
		fmt.Printf("Traffic routing through proxy server: %s\n", proxyURL.String())
	}
}
