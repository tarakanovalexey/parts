<#import "parts/common.ftl" as c>

<@c.page>
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link active" href="/">На главную</a>
        </li>
    </ul>
    <br/>
    <br/>
    Редактирование записи:
    <br/>
    <table>
        <thead class="thead-dark">
        <tr>
            <th scope="col">Наименование</th>
            <th scope="col">Необходимость</th>
            <th scope="col">Количество</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${part.getPartName()}</td>
            <td><#if (part.isRequired())!true>Да<#else>Нет</#if></td>
            <td>${part.getQuantity()}</td>
        </tr>
        </tbody>
    </table>
    <form method="post" action="/editapply">
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
            <input type="hidden" name="search_id" value="${part.getId()}"/>
            <button type="submit" class="btn btn-success">Изменить</button>
        </div>
    </form>
</@c.page>