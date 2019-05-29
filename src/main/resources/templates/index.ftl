<#import "parts/pager.ftl" as p>
<#import "parts/common.ftl" as c>

<@c.page>
    <table>
        <tr>
            <th scope="col">
                <div class="input-group ml-5">
                    <form method="post" action="/add">
                        <div class="input-group mb-1">
                            <input type="text" name="partName" placeholder="Наименование" />
                        </div>
                        <div class="input-group mb-1">
                            <input type="number" name="quantity" placeholder="Количество" />
                        </div>
                        <div class="input-group mb-1">
                            <input type="checkbox" name="isRequired" class="form-check-input ml-3" id="exampleCheck1">
                            <label class="form-check-label ml-5" for="exampleCheck1">Необходимость</label>
                        </div>
                        <div class="input-group mb-1">
                            <button type="submit" class="btn btn-success">Добавить</button>
                        </div>
                    </form>
                </div>
            </th>
            <th scope="col">
                <div class="input-group ml-3">
                    <form method="post" action="/search">
                        <div class="input-group mb-1">
                            <input type="text" name="searchname" placeholder="Наименование" />
                        </div>
                        <div class="input-group mb-1">
                            <button type="submit" class="btn btn-primary">Найти</button>
                        </div>
                    </form>
                </div>
            </th>
            <th scope="col">
                <div class="input-group ml-3">
                    <form method="get" action="/">
                        <div class="input-group m-1">
                            <button type="submit" class="btn btn-secondary">Все детали</button>
                        </div>
                    </form>
                    <form method="get" action="/changeview">
                        <div class="input-group m-1">
                            <button type="submit" class="btn btn-secondary">Необходимые для сборки</button>
                        </div>
                    </form>
                    <form method="get" action="/changeview1">
                        <div class="input-group m-1">
                            <button type="submit" class="btn btn-secondary">Опциональные</button>
                        </div>
                    </form>
                </div>
            </th>
        </tr>
    </table>
<ul>
    <#assign count = 1+page.number*10>
    <#list page.iterator()>
        <table class="table table-striped">
            <thead class="thead-dark">
            <tr>
                <th scope="col">#</th>
                <th scope="col">Наименование</th>
                <th scope="col">Необходимость</th>
                <th scope="col">Количество</th>
                <th scope="col">Изменить</th>
                <th scope="col">Удалить</th>
            </tr>
            </thead>
            <tbody>
            <#items as item>
            <tr>
                <th scope="row">${count}</th>
                <#assign count++>
                <td>${item.getPartName()}</td>
                <td>
                    <#if (item.isRequired())!true>Да<#else>Нет</#if>
                </td>
                <td>${item.getQuantity()}</td>
                <td>
                    <form method="post" action="/edit">
                        <input type="hidden" name="search_id" value="${item.getId()}"/>
                        <button class="btn btn-warning btn-sm" type="submit">Изменить</button>
                    </form>
                </td>
                <td>
                    <form method="post" action="/delete">
                        <input type="hidden" name="search_id" value="${item.getId()}"/>
                        <button class="btn btn-danger btn-sm" type="submit">Удалить</button>
                    </form>
                </td>
            </tr>
            </#items>
            </tbody>
        </table>
    </#list>
    <br/>

</ul>
<@p.pager url page/>
    <div class="alert alert-info" role="alert">
        <h2>Можно собрать ${countCompToBuild} компьютеров</h2>
    </div>
</@c.page>