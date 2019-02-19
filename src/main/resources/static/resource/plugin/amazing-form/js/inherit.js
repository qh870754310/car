/**
 * 寄生组合式继承
 * @param subType 子类型
 * @param superType 父类型
 */
function inheritPrototype(subType, superType) {
    var prototype = Object.create(superType.prototype);//创建父类原型的一个副本
    prototype.constructor = subType;//为副本添加constructor属性,弥补重写原型而失去的constructor属性
    subType.prototype = prototype;////将创建的副本赋值给子类的原型
}