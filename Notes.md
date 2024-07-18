```html
<div>
    <%= form.submit "refresh" %>
</div>
```

```rb
if params[:commit] == "refresh"
    render :new, status: :unprocessable_entity
end
```

```js
refresh() {
    this.element.querySelector("input[type=submit][value=refresh]").click()
}
```

```rb
data: {controller: "form", action: "change->form#refresh"}
```

```html
<meta name="turbo-refresh-method" content="morph">
<meta name="turbo-refresh-scroll" content="preserve">
```
